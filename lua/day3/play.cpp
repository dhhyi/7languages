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

static int track = 0;
static int channel = 0;
static int position = 0;

int midi_send(lua_State *L)
{
    double key = lua_tonumber(L, -3);
    double velocity = lua_tonumber(L, -2);
    double duration = lua_tonumber(L, -1);

    cout << "writing note {"
         << "key:" << key << " "
         << "velocity:" << velocity << " "
         << "duration:" << duration
         << "}" << endl
         << flush;

    int tpq = midifile.getTPQ();

    int starttick = int(position * tpq);
    int endtick = starttick + int(duration * tpq);
    midifile.addNoteOn(track, starttick, channel, key, velocity);
    midifile.addNoteOff(track, endtick, channel, key);

    position += duration;

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

    int instr = 0;
    midifile.addTimbre(track, 0, channel, instr);

    luaL_dofile(L, argv[1]);

    lua_close(L);

    string filename = argv[1];
    filename.replace(filename.end() - 3, filename.end(), "mid");
    midifile.write(filename);

    return 0;
}
