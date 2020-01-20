module Typography exposing (text__)

import Html.Styled exposing (text)
import Set exposing (Set)


{-| Avoid typographic mistakes

1.  Split string into lines
2.  Glue last 2 words in a line together (if line consists of 3 and more)
3.  Replace spaces after specific words with nbsp
4.  Glue lines back together

Ideally it should be stored in both clean and processed forms in database.
But I don't have one, so why not process everything in real time? :D

-}
text__ : String -> Html.Styled.Html msg
text__ =
    String.lines
        >> List.map processLine
        >> String.join "\n"
        >> text


processLine : String -> String
processLine =
    String.words
        >> List.foldr
            (\word tail ->
                if Set.member (String.toLower word) dictionary then
                    word ++ nbsp ++ tail

                else if tail == "" then
                    word

                else
                    word ++ " " ++ tail
            )
            ""


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

    -- russian
    , "а"
    , "в"
    , "ваш"
    , "ваших"
    , "во"
    , "все"
    , "всё"
    , "где"
    , "для"
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
    , "мой"
    , "моя"
    , "мы"
    , "на"
    , "наш"
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
    , "это"
    , "я"
    ]
        |> Set.fromList
