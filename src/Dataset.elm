module Dataset exposing (..)

import Book exposing (..)
import Dict exposing (Dict)
import Project exposing (..)



{-
   as long as I don't use relational database for this library,
   book title is a key. To keep things consistent, title should be never changed :D
-}


knownBooks : Dict String Book
knownBooks =
    [ Book
        { author = "Miran Lipovača"
        , title = "Learn You a Haskell for Great Good!"
        , topics = HASKELL
        , url = "http://learnyouahaskell.com/"
        }
    , Book
        { author = "Professor Frisby"
        , title = "Mostly Adequate Guide to Functional Programming"
        , topics = JS
        , url = "https://mostly-adequate.gitbooks.io/mostly-adequate-guide/"
        }
    , Book
        { author = "Douglas Crockford"
        , title = "JavaScript: The Good Parts"
        , topics = JS
        , url = "http://shop.oreilly.com/product/9780596517748.do"
        }
    , Book
        { author = "Luis Atencio"
        , title = "Functional Programming in JavaScript"
        , topics = JS
        , url = "https://www.manning.com/books/functional-programming-in-javascript"
        }
    , Book
        { author = "Sam Newman"
        , title = "Building Microservices"
        , topics = DEV
        , url = "http://shop.oreilly.com/product/0636920033158.do"
        }
    , Book
        { author = "Alvin Alexander"
        , title = "Learning Functional Programming in Scala"
        , topics = SCALA
        , url = "https://alvinalexander.com/downloads/learning-fp-in-scala-0.1.1.pdf"
        }
    , Book
        { author = "Kyle Simpson"
        , title = "You Don't Know JS (book series) 1, 2, 3, 4"
        , topics = JS
        , url = "https://github.com/getify/You-Dont-Know-JS"
        }
    , Book
        { author = "Bruce Eckel, Dianne Marsh"
        , title = "Atomic Scala"
        , topics = SCALA
        , url = "http://www.atomicscala.com"
        }
    , Book
        { author = "Robert Martin"
        , title = "Clean Code. A Handbook of Agile Software Craftsmanship"
        , topics = DEV
        , url = "https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship-ebook/dp/B001GSTOAM"
        }
    , Book
        { author = "Максим Пацианский"
        , title = "Роутинг в react-приложениях"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/react-router-course-ru/content"
        }
    , Book
        { author = "Максим Пацианский"
        , title = "React Redux курс для начинающих"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/redux-course-ru-v2/content/"
        }
    , Book
        { author = "Максим Пацианский"
        , title = "React.js курс для начинающих"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/react-course-ru-v2/content/"
        }
    , Book
        { author = "Stoyan Stefanov"
        , title = "JavaScript Patterns: Build Better Applications with Coding and Design Patterns"
        , topics = JS
        , url = "https://shop.oreilly.com/product/9780596806767.do"
        }
    , Book
        { author = "David Sawyer McFarland"
        , title = "CSS: The Missing Manual"
        , topics = CSS
        , url = "https://shop.oreilly.com/product/0636920036357.do"
        }
    , Book
        { author = "Rebecca Hagen, Kim Golombisky"
        , title = "White Space Is Not Your Enemy"
        , topics = DESIGN
        , url = "http://cw.routledge.com/textbooks/9780240824147"
        }
    , Book
        { author = "Артемий Лебедев"
        , title = "Ководство"
        , topics = DESIGN
        , url = "https://www.artlebedev.ru/kovodstvo/sections/"
        }
    , Book
        { author = "Erin Kissane"
        , title = "The Elements of Content Strategy"
        , topics = DESIGN
        , url = "https://abookapart.com/products/the-elements-of-content-strategy"
        }
    , Book
        { author = "Aarron Walter"
        , title = "Designing For Emotion"
        , topics = DESIGN
        , url = "https://abookapart.com/products/designing-for-emotion"
        }
    , Book
        { author = "Ethan Mascotte"
        , title = "Responsive Web Design"
        , topics = DESIGN
        , url = "https://abookapart.com/products/responsive-web-design"
        }
    , Book
        { author = "Aspen Pittman"
        , title = "The Tube Amp Book - Deluxe Revised Edition"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Tube-Amp-Book-Deluxe-Revised/dp/0879307676"
        }
    , Book
        { author = "Donald Brosnac"
        , title = "Guitar Electronics for Musicians"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Guitar-Electronics-Musicians-Donald-Brosnac/dp/0711902321"
        }
    , Book
        { author = "Hideo Kamimoto"
        , title = "Complete Guitar Repair"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Complete-Guitar-Repair-Hideo-Kamimoto/dp/0825601568"
        }
    , Book
        { author = "Roger H. Siminoff"
        , title = "The Luthier's Handbook"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://straightupstrings.com/collections/books-and-drawings/products/the-luthiers-handbook"
        }
    , Book
        { author = "Paul Balmer (Author), Les Paul (Foreword)"
        , title = "The Gibson Les Paul Handbook"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Gibson-Paul-Handbook-Maintain-Troubleshoot/dp/0760334706"
        }
    , Book
        { author = "Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides"
        , title = "Design Patterns: Elements of Reusable Object-Oriented Software"
        , topics = DEV
        , url = "https://www.amazon.com/Design-Patterns-Object-Oriented-Addison-Wesley-Professional-ebook/dp/B000SEIBB8"
        }
    , Book
        { author = "Pat Brisbin"
        , title = "Maybe Haskell"
        , topics = HASKELL
        , url = "https://books.thoughtbot.com/assets/maybe-haskell.pdf"
        }
    , Book
        { author = "Harold Abelson, Gerald Jay Sussman, Julie Sussman"
        , title = "Structure and Interpretation of Computer Programs"
        , topics = SCHEME
        , url = "https://www.amazon.com/Structure-Interpretation-Computer-Programs-Engineering/dp/0262510871"
        }
    , Book
        { author = "Bartosz Milewski"
        , title = "Category Theory for Programmers"
        , topics = HASKELL
        , url = "https://github.com/hmemcpy/milewski-ctfp-pdf"
        }
    , Book
        { author = "Noel Welsh, Dave Gurnell"
        , title = "Essential Scala"
        , topics = SCALA
        , url = "https://underscore.io/books/essential-scala/"
        }
    , Book
        { author = "Noel Welsh, Dave Gurnell"
        , title = "Scala with Cats"
        , topics = SCALA
        , url = "https://underscore.io/books/scala-with-cats/"
        }
    , Book
        { author = "Vitaly Bragilevsky"
        , title = "Haskell in Depth"
        , topics = HASKELL
        , url = "https://www.manning.com/books/haskell-in-depth"
        }
    , Book
        { author = "Дэйв Логан, Джон Кинг, Хэли Фишер-Райт"
        , title = "Лидер и племя"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/lider-i-plemya/"
        }
    , Book
        { author = "Фредерик Лалу"
        , title = "Открывая организации будущего"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/novyj-vzglyad-na-organizacii/"
        }
    , Book
        { author = "Питер Брегман"
        , title = "Эмоциональная смелость"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/emoczionalnaya-smelost/"
        }
    , Book
        { author = "Джон Хеннесси"
        , title = "Принципы лидера"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/princzipyi-lidera/"
        }
    , Book
        { author = "Ричард Пулин"
        , title = "Школа дизайна: шрифт"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/shkola-dizajna-shrift/"
        }
    , Book
        { author = "Кейт Феррацци, Тал Рэз"
        , title = "Никогда не ешьте в одиночку"
        , topics = COMMUNICATION
        , url = "https://www.mann-ivanov-ferber.ru/books/mif/nevereatalone/"
        }
    , Book
        { author = "Джон Дорр"
        , title = "Измеряйте самое важное"
        , topics = MANAGEMENT
        , url = "https://www.mann-ivanov-ferber.ru/books/izmeryajte-samoe-vazhnoe/"
        }
    , Book
        { author = "Рэй Далио"
        , title = "Принципы"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/princzipyi/"
        }
    , Book
        { author = "Ричард Пулин"
        , title = "Школа дизайна: макет"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/shkola-dizajna-maket/"
        }
    ]
        |> List.map (\((Book { title }) as book) -> ( title, book ))
        |> Dict.fromList


projects : List Project
projects =
    [ Project
        { name = "Translation of the Mostly Adequate Guide"
        , description = """Russian version 
      of the Mostly Adequate Guide to Functional Programming in JavaScript by Brian Lonsdorf.
      The translation was initiated by Maxim Filippov and stopped at 60%.
      Then me and Sakayama joined the translation, 
      refactored every chapter translated before us and then finished the translation."""
        , links =
            [ Link "Russian translation" "https://github.com/MostlyAdequate/mostly-adequate-guide-ru/blob/master/SUMMARY-ru.md"
            , Link "Original book" "https://mostly-adequate.gitbooks.io/mostly-adequate-guide/"
            ]
        , imgFileName = Just "mostly_adequate_guide_fp_ru.png"
        , team =
            Team
                [ TeamMate "Maxim Filippov" (GitHubUserId 860283) "https://github.com/maksimf"
                , TeamMate "Sakayama" (GitHubUserId 44540001) "https://github.com/Sakayama"
                , TeamMate "other contributors" NoPic "https://github.com/MostlyAdequate/mostly-adequate-guide-ru/graphs/contributors"
                ]
        }
    , Project
        { name = "#FACFAF. Quick reference guide"
        , description = "A small book about Curtis Mayfield «Black Keys» Open F# guitar tuning."
        , links =
            [ Link "PDF" "https://www.gitbook.com/download/pdf/book/vladimirlogachev/facfaf"
            , Link "ePub" "https://www.gitbook.com/download/epub/book/vladimirlogachev/facfaf"
            , Link "Read online" "https://www.gitbook.com/read/book/vladimirlogachev/facfaf"
            ]
        , imgFileName = Just "facfaf.jpg"
        , team = OnlyMe
        }
    , Project
        { name = "Lion Bot"
        , description = """A fullstack app, bot for Slack.
      Made in collaboration as a Build-To-Learn project (part of Chingu Cohorts workflow).
      My work is Slack's «frontend» and app's landing page, 
      but also I've made some contribution to the server."""
        , links =
            [ Link "Live" "http://lion-bot.herokuapp.com/"
            , Link "GitHub" "https://github.com/gang-of-four-lions/lion-bot"
            , Link "Chingu" "https://chingu.io/"
            ]
        , imgFileName = Just "lionbot.jpg"
        , team =
            Team
                [ TeamMate "Michael Blood" (GitHubUserId 12065896) "https://github.com/michaelblood"
                , TeamMate "Josh Sanders" (GitHubUserId 19422930) "https://github.com/Josh5231"
                , TeamMate "Alex McLeod" (GitHubUserId 24363605) "https://github.com/AlexMcLeod01"
                ]
        }
    ]



{- if book is not found in states Dict, then it is not in Library :D -}


libraryState : Dict String BookAvaliability
libraryState =
    Dict.fromList
        [ ( "Лидер и племя", GivenToSomeone )
        , ( "Открывая организации будущего", Available )
        , ( "Эмоциональная смелость", ComingSoon )
        , ( "Принципы лидера", ComingSoon )
        , ( "Школа дизайна: шрифт", ComingSoon )
        , ( "Никогда не ешьте в одиночку", ComingSoon )
        , ( "Измеряйте самое важное", ComingSoon )
        , ( "Принципы", ComingSoon )
        , ( "Школа дизайна: макет", ComingSoon )
        , ( "Haskell in Depth", ComingSoon )
        , ( "The Tube Amp Book - Deluxe Revised Edition", Available )
        , ( "Guitar Electronics for Musicians", Available )
        , ( "Complete Guitar Repair", Available )
        , ( "The Luthier's Handbook", Available )
        , ( "The Gibson Les Paul Handbook", Available )
        ]


learningPath : List LearningMaterial
learningPath =
    [ BookTitle "Scala with Cats"
    , BookTitle "Essential Scala"
    , BookTitle "Category Theory for Programmers"
    , BookTitle "Structure and Interpretation of Computer Programs"
    , BookTitle "Maybe Haskell"
    , BookTitle "Design Patterns: Elements of Reusable Object-Oriented Software"
    , BookTitle "Learn You a Haskell for Great Good!"
    , BookTitle "Mostly Adequate Guide to Functional Programming"
    , BookTitle "JavaScript: The Good Parts"
    , BookTitle "Functional Programming in JavaScript"
    , BookTitle "Building Microservices"
    , BookTitle "Learning Functional Programming in Scala"
    , BookTitle "You Don't Know JS (book series) 1, 2, 3, 4"
    , BookTitle "Atomic Scala"
    , BookTitle "Clean Code. A Handbook of Agile Software Craftsmanship"
    , BookTitle "Роутинг в react-приложениях"
    , BookTitle "React Redux курс для начинающих"
    , BookTitle "React.js курс для начинающих"
    , BookTitle "JavaScript Patterns: Build Better Applications with Coding and Design Patterns"
    , BookTitle "CSS: The Missing Manual"
    , BookTitle "White Space Is Not Your Enemy"
    , BookTitle "Ководство"
    , BookTitle "The Elements of Content Strategy"
    , BookTitle "Designing For Emotion"
    , BookTitle "Responsive Web Design"
    ]
