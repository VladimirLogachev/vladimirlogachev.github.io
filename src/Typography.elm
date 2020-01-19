module Typography exposing (processString, processText)

import Html.Styled exposing (text)
import Set exposing (Set)


{-| Same as processString, but returns Styled Html
-}
processText : String -> Html.Styled.Html msg
processText =
    processString >> text


{-| Avoid typographic mistakes

1.  Split string into lines
2.  Glue last 3 words in a line together
3.  Replace spaces after specific words with nbsp
4.  Glue lines back together

Ideally it should be stored in both clean and processed forms in database.
But I don't have one, so why not process everything in real time? :D

-}
processString : String -> String
processString =
    String.lines
        >> List.map processLine
        >> String.join "\n"


processLine : String -> String
processLine =
    String.words
        >> joinLast3Words
        >> List.foldr
            (\word tail ->
                if Set.member (String.toLower word) dictionary then
                    word ++ nbsp ++ tail

                else
                    word ++ " " ++ tail
            )
            ""


joinLast3Words : List String -> List String
joinLast3Words words =
    case List.reverse words of
        a :: b :: c :: xs ->
            List.reverse ((c ++ nbsp ++ b ++ nbsp ++ a) :: xs)

        [ a, b ] ->
            [ b ++ nbsp ++ a ]

        _ ->
            words


nbsp : String
nbsp =
    "\u{00A0}"


dictionary : Set String
dictionary =
    [ -- punctuation
      "-"
    , "—"
    , "+"

    -- english
    , "a"
    , "about"
    , "an"
    , "and"
    , "any"
    , "are"
    , "as"
    , "at"
    , "au"
    , "be"
    , "bi"
    , "but"
    , "by"
    , "can"
    , "de"
    , "do"
    , "et"
    , "fit"
    , "for"
    , "from"
    , "give"
    , "go"
    , "going"
    , "had"
    , "he"
    , "i"
    , "if"
    , "in"
    , "is"
    , "it"
    , "just"
    , "know"
    , "la"
    , "let"
    , "made"
    , "may"
    , "me"
    , "my"
    , "no"
    , "not"
    , "of"
    , "on"
    , "or"
    , "part"
    , "real"
    , "see"
    , "seek"
    , "sent"
    , "so"
    , "than"
    , "that"
    , "the"
    , "them"
    , "there"
    , "this"
    , "to"
    , "up"
    , "upon"
    , "watch"
    , "wd"
    , "we"
    , "what"
    , "whether"
    , "which"
    , "who"
    , "why"
    , "will"
    , "with"
    , "you"

    -- russian
    , "а"
    , "в"
    , "во"
    , "все"
    , "всё"
    , "где"
    , "до"
    , "ее"
    , "её"
    , "если"
    , "за"
    , "и"
    , "из"
    , "ими"
    , "их"
    , "к"
    , "мы"
    , "на"
    , "не"
    , "ни"
    , "но"
    , "о"
    , "он"
    , "от"
    , "по"
    , "с"
    , "слов"
    , "со"
    , "столь"
    , "так"
    , "таким"
    , "тем"
    , "теми"
    , "то"
    , "той"
    , "тот"
    , "у"
    , "я"
    ]
        |> Set.fromList
