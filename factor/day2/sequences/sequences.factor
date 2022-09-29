USING: kernel sequences ;

IN: day2.sequences

: find-first ( seq quot -- x )
    swap ! quot seq
    dup ! quot seq seq
    length 0 = ! quot seq length=0
    [
        2drop
        f ! not found
    ]
    [
        2dup ! quot seq quot seq
        first ! quot seq quot first
        dup ! quot seq quot first first
        rot ! quot seq first first quot
        call inline ! quot seq first first=result
        [
            2nip ! return first
        ]
        [
            drop ! quot seq
            1 tail ! quot tail
            swap ! tail quot
            find-first ! recurse on tail
        ] if
    ] if
  ;
