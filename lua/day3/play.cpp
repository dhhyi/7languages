extern "C"
{
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
}

#include "midifile/MidiFile.h"
#include "midifile/Options.h"
#include <iostream>
#include <random>

using namespace std;
using namespace smf;

static MidiFile midifile;

static int channel = 0;
int instr = 0;
static vector<double> positions = {};

double getPosition(int track)
{
    if (track > positions.size())
    {
        if (track > 0)
            midifile.addTrack();
        midifile.addTimbre(track - 1, 0, channel, instr);

        positions.push_back(0.0);
    }
    return positions[track - 1];
}

void setPosition(int track, double position)
{
    positions[track - 1] = position;
}

int midi_send(lua_State *L)
{
    double track = lua_tonumber(L, -4);
    double key = lua_tonumber(L, -3);
    double velocity = lua_tonumber(L, -2);
    double duration = lua_tonumber(L, -1);

    cout << "writing note {"
         << "track:" << track << " "
         << "key:" << key << " "
         << "velocity:" << velocity << " "
         << "duration:" << duration
         << "}" << endl
         << flush;

    int tpq = midifile.getTPQ();

    double position = getPosition(track);

    int starttick = int(position * tpq);
    int endtick = starttick + int(duration * tpq);
    midifile.addNoteOn(track - 1, starttick, channel, key, velocity);
    midifile.addNoteOff(track - 1, endtick, channel, key);

    setPosition(track, position + duration);

    return 0;
}

int main(int argc, char *argv[])
{
    if (argc < 1)
        return -1;

    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    lua_pushcfunction(L, midi_send);
    lua_setglobal(L, "midi_send");

    luaL_dofile(L, argv[1]);

    lua_close(L);

    midifile.sortTracks();

    string filename = argv[1];
    filename.replace(filename.end() - 3, filename.end(), "mid");
    midifile.write(filename);

    return 0;
}
