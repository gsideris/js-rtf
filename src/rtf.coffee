class RTFDocument
    rtf : ''
    fonts : []
    colors : []
    
    constructor : () ->

    add_font : (name) ->
        @fonts.push name

    add_color : (name,r,g,b) ->
        @colors[name] = [r,g,b]


    set_font : (n) -> 
        @rtf += "\\f#{n}"
    set_font_size : (s) ->
        d = s * 2
        @rtf += "\\fs#{d}"
    set_colour : (c) ->
        @rtf += "\\cf#{c}"

    italics_on : () -> 
        @rtf += '\\i'
    italics_off : () -> 
        @rtf += '\\i0'
    bold_on : () -> 
        @rtf += '\\b'
    bold_off : () -> 
        @rtf += '\\b0'
    small_caps_on : () -> 
        @rtf += '\\scaps'
    small_caps_off :() -> 
        @rtf += '\\scaps0'
    caps_on : () -> 
        @rtf += '\\caps'
    caps_off : () -> 
        @rtf += '\\caps0'
    strike_on : () -> 
        @rtf += '\\strike'
    strike_off : () -> 
        @rtf += '\\strike0'
    outline_on : () -> 
        @rtf += '\\outline'
    outline_off : () -> 
        @rtf += '\\outline0'

    margin_top :(s) -> 
        @rtf += "\\margt#{s}"
    margin_bottom :(s) -> 
        @rtf += "\\margb#{s}"
    margin_left :(s) -> 
        @rtf += "\\margl#{s}"
    margin_right : (s) ->
        @rtf += "\\margr#{s}"
    paper_width :(w) ->
        @rtf += "\\paperw#{w}"
    paper_height : (h) ->
        @rtf += "\\paperh#{h}"

    new_page : () ->
        @rtf += "\\page"

    new_line : () ->
        @rtf += "\\line"

    new_paragraph : () ->
        @rtf += "\\par"
        
    center : () ->
        @rtf += "\\qc"

    left : () ->
        @rtf += "\\ql"

    right : () ->
        @rtf += "\\qr"

    justify : () ->
        @rtf += "\\qj"



    text :(t)->
        @rtf += t

    save : () ->
        fn = 0
        font_table = ''
        for i in @fonts
            font_table += "{\\f#{fn} #{i}}"
            fn = fn + 1

        color_table = ''
        for k,v in @colors
            color_table += "\\red#{v[0]}\\green#{v[1]}\\blue#{v[2]}"

        return  '{\\rtf1\\ansi\\deff0' +
                '{\\fonttbl ' +
                font_table  +   
                '}' +
                '{\\colortbl;' + 
                color_table +
                '}' +
                @rtf +
                '}'

