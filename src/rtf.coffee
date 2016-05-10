class RTFDocument
    rtf : ''
    fonts : []
    colors : []

    colornum : 0
    
    constructor : () ->

    add_font : (name) ->
        @fonts.push name

    add_color : (name,r,g,b) ->
        @colors[name] = [@colornum,r,g,b]
        console.log("Adding #{name} r#{r},g#{g},b#{b} - id :#{@colornum}")
        @colornum += 1

    set_font : (name) -> 
        index = @fonts.indexOf(name)
        @rtf += "\\f#{index}"
    set_font_size : (s) ->
        d = s * 2
        @rtf += "\\fs#{d}"
    set_color : (name) ->
        id = @colors[name][0]
        @rtf += "\\cf#{id}"


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

    page : () ->
        @rtf += "\\page"

    line : () ->
        @rtf += "\\line"

    paragraph : () ->
        @rtf += "\\par\\pard"
        
    center : () ->
        @rtf += "\\qc"

    left : () ->
        @rtf += "\\ql"

    right : () ->
        @rtf += "\\qr"

    justify : () ->
        @rtf += "\\qj"



    text :(t)->
        @rtf += " #{t}"

    save : () ->
        fn = 0
        font_table = ''
        for i in @fonts
            font_table += "{\\f#{fn} #{i}}"
            fn = fn + 1

        color_table = ''
        console.log(@colors)
        for k,v of @colors
            color_table += "\\red#{v[1]}\\green#{v[2]}\\blue#{v[3]}"

        return  '{\\rtf1\\ansi\\deff0' +
                '{\\fonttbl ' +
                font_table  +   
                '}' +
                '{\\colortbl;' + 
                color_table +
                '}' +
                @rtf +
                '}'




