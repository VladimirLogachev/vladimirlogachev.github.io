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
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/41OnGOPKW3L._SX376_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Professor Frisby"
        , title = "Mostly Adequate Guide to Functional Programming"
        , topics = JS
        , url = "https://mostly-adequate.gitbooks.io/mostly-adequate-guide/"
        , coverUrl = "https://github.com/MostlyAdequate/mostly-adequate-guide/raw/master/images/cover.png"
        }
    , Book
        { author = "Douglas Crockford"
        , title = "JavaScript: The Good Parts"
        , topics = JS
        , url = "http://shop.oreilly.com/product/9780596517748.do"
        , coverUrl = "https://covers.oreillystatic.com/images/9780596517748/cat.gif"
        }
    , Book
        { author = "Luis Atencio"
        , title = "Functional Programming in JavaScript"
        , topics = JS
        , url = "https://www.manning.com/books/functional-programming-in-javascript"
        , coverUrl = "https://images.manning.com/720/960/resize/book/5/c5bd123-f4fd-4a03-9069-9309c782ea7e/Atencio_hires_Fc.png"
        }
    , Book
        { author = "Sam Newman"
        , title = "Building Microservices"
        , topics = DEV
        , url = "http://shop.oreilly.com/product/0636920033158.do"
        , coverUrl = "https://covers.oreillystatic.com/images/0636920033158/cat.gif"
        }
    , Book
        { author = "Alvin Alexander"
        , title = "Learning Functional Programming in Scala"
        , topics = SCALA
        , url = "https://alvinalexander.com/downloads/learning-fp-in-scala-0.1.1.pdf"
        , coverUrl = "/images/book_covers/alvin_scala.png"
        }
    , Book
        { author = "Kyle Simpson"
        , title = "You Don't Know JS (book series) 1, 2, 3, 4"
        , topics = JS
        , url = "https://github.com/getify/You-Dont-Know-JS"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/91w8pQAh21L._SY300_.jpg"
        }
    , Book
        { author = "Bruce Eckel, Dianne Marsh"
        , title = "Atomic Scala"
        , topics = SCALA
        , url = "http://www.atomicscala.com"
        , coverUrl = "https://static-2.gumroad.com/res/gumroad/2484219515800/asset_previews/baa9edfdda1f0636d3141c6336006e1c/original/scala_20ebook_20cover_20web.gif"
        }
    , Book
        { author = "Robert Martin"
        , title = "Clean Code. A Handbook of Agile Software Craftsmanship"
        , topics = DEV
        , url = "https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship-ebook/dp/B001GSTOAM"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/51d1qVhmAmL._SX373_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Максим Пацианский"
        , title = "Роутинг в react-приложениях"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/react-router-course-ru/content"
        , coverUrl = "/images/book_covers/router.png"
        }
    , Book
        { author = "Максим Пацианский"
        , title = "React Redux курс для начинающих"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/redux-course-ru-v2/content/"
        , coverUrl = "http://sun9-67.userapi.com/c840028/v840028135/32fdf/b4evZGUdoOg.jpg"
        }
    , Book
        { author = "Максим Пацианский"
        , title = "React.js курс для начинающих"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/react-course-ru-v2/content/"
        , coverUrl = "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1484152353l/33838152._SX318_.jpg"
        }
    , Book
        { author = "Stoyan Stefanov"
        , title = "JavaScript Patterns: Build Better Applications with Coding and Design Patterns"
        , topics = JS
        , url = "https://shop.oreilly.com/product/9780596806767.do"
        , coverUrl = "https://covers.oreillystatic.com/images/9780596806767/cat.gif"
        }
    , Book
        { author = "David Sawyer McFarland"
        , title = "CSS: The Missing Manual"
        , topics = CSS
        , url = "https://shop.oreilly.com/product/0636920036357.do"
        , coverUrl = "https://covers.oreillystatic.com/images/0636920036357/cat.gif"
        }
    , Book
        { author = "Rebecca Hagen, Kim Golombisky"
        , title = "White Space Is Not Your Enemy"
        , topics = DESIGN
        , url = "http://cw.routledge.com/textbooks/9780240824147"
        , coverUrl = "https://m.media-amazon.com/images/I/41xlqwc2nUL._AC_UY218_ML3_.jpg"
        }
    , Book
        { author = "Артемий Лебедев"
        , title = "Ководство"
        , topics = DESIGN
        , url = "https://www.artlebedev.ru/kovodstvo/sections/"
        , coverUrl = "https://www.artlebedev.ru/kovodstvo/sections/ekovodstvo.png"
        }
    , Book
        { author = "Эрин Киссейн"
        , title = "Основы контентной стратегии"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/book-apart/elements-content-strategy/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/51/4351/1.00x-thumb.png"
        }
    , Book
        { author = "Аарон Уолтер"
        , title = "Эмоциональный веб-дизайн"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/book-apart/emotional-web-design/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/95/4295/1.00x-thumb.png"
        }
    , Book
        { author = "Итан Маркотт"
        , title = "Отзывчивый веб-дизайн"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/book-apart/otzivchivij-web-design/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/60/4360/1.00x-thumb.png"
        }
    , Book
        { author = "Aspen Pittman"
        , title = "The Tube Amp Book - Deluxe Revised Edition"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Tube-Amp-Book-Deluxe-Revised/dp/0879307676"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/513XusQiVJL._SX405_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Donald Brosnac"
        , title = "Guitar Electronics for Musicians"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Guitar-Electronics-Musicians-Donald-Brosnac/dp/0711902321"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/51dgoNDxFnL._SX377_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Hideo Kamimoto"
        , title = "Complete Guitar Repair"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Complete-Guitar-Repair-Hideo-Kamimoto/dp/0825601568"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/51E%2BG7TYQqL._SX356_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Roger H. Siminoff"
        , title = "The Luthier's Handbook"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://straightupstrings.com/collections/books-and-drawings/products/the-luthiers-handbook"
        , coverUrl = "https://cdn.shopify.com/s/files/1/0955/2708/products/parts505_370x.jpg?v=1439353466"
        }
    , Book
        { author = "Paul Balmer (Author), Les Paul (Foreword)"
        , title = "The Gibson Les Paul Handbook"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Gibson-Paul-Handbook-Maintain-Troubleshoot/dp/0760334706"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/51hTBrgnPjL._SX379_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides"
        , title = "Design Patterns: Elements of Reusable Object-Oriented Software"
        , topics = DEV
        , url = "https://www.amazon.com/Design-Patterns-Object-Oriented-Addison-Wesley-Professional-ebook/dp/B000SEIBB8"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/51kuc0iWoKL._SX326_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Pat Brisbin"
        , title = "Maybe Haskell"
        , topics = HASKELL
        , url = "https://books.thoughtbot.com/assets/maybe-haskell.pdf"
        , coverUrl = "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1427714317l/25249192.jpg"
        }
    , Book
        { author = "Harold Abelson, Gerald Jay Sussman, Julie Sussman"
        , title = "Structure and Interpretation of Computer Programs"
        , topics = SCHEME
        , url = "https://www.amazon.com/Structure-Interpretation-Computer-Programs-Engineering/dp/0262510871"
        , coverUrl = "https://images-na.ssl-images-amazon.com/images/I/51H17R%2BbW8L._SX331_BO1,204,203,200_.jpg"
        }
    , Book
        { author = "Bartosz Milewski"
        , title = "Category Theory for Programmers"
        , topics = HASKELL
        , url = "https://github.com/hmemcpy/milewski-ctfp-pdf"
        , coverUrl = "https://blurb-pdf-processing-service-prod-preflight.s3.amazonaws.com/default/blurb/P14850377/preview_72dpi/cover-trim-no-fold-front_cover-f21dfbed-5945-4d12-be90-0eb565aba6ad.jpg"
        }
    , Book
        { author = "Noel Welsh, Dave Gurnell"
        , title = "Essential Scala"
        , topics = SCALA
        , url = "https://underscore.io/books/essential-scala/"
        , coverUrl = "https://underscore.io/images/books/essential-scala.png"
        }
    , Book
        { author = "Noel Welsh, Dave Gurnell"
        , title = "Scala with Cats"
        , topics = SCALA
        , url = "https://underscore.io/books/scala-with-cats/"
        , coverUrl = "https://underscore.io/images/books/scala-with-cats.png"
        }
    , Book
        { author = "Vitaly Bragilevsky"
        , title = "Haskell in Depth"
        , topics = HASKELL
        , url = "https://www.manning.com/books/haskell-in-depth"
        , coverUrl = "https://images.manning.com/720/960/resize/book/9/16e1d67-4262-4e32-83c3-5cf65467e91e/Bragilevsky-Haskell-MEAP-HI.png"
        }
    , Book
        { author = "Дэйв Логан, Джон Кинг, Хэли Фишер-Райт"
        , title = "Лидер и племя"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/lider-i-plemya/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/59/17759/0.50x-thumb.png"
        }
    , Book
        { author = "Фредерик Лалу"
        , title = "Открывая организации будущего"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/novyj-vzglyad-na-organizacii/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/86/15686/0.50x-thumb.png"
        }
    , Book
        { author = "Питер Брегман"
        , title = "Эмоциональная смелость"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/emoczionalnaya-smelost/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/93/23793/0.50x-thumb.png"
        }
    , Book
        { author = "Джон Хеннесси"
        , title = "Принципы лидера"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/princzipyi-lidera/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/32/24032/0.50x-thumb.png"
        }
    , Book
        { author = "Ричард Пулин"
        , title = "Школа дизайна: шрифт"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/shkola-dizajna-shrift/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/08/23308/0.50x-thumb.png"
        }
    , Book
        { author = "Кейт Феррацци, Тал Рэз"
        , title = "Никогда не ешьте в одиночку"
        , topics = COMMUNICATION
        , url = "https://www.mann-ivanov-ferber.ru/books/mif/nevereatalone/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/89/2589/0.50x-thumb.png"
        }
    , Book
        { author = "Джон Дорр"
        , title = "Измеряйте самое важное"
        , topics = MANAGEMENT
        , url = "https://www.mann-ivanov-ferber.ru/books/izmeryajte-samoe-vazhnoe/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/18/22218/0.50x-thumb.png"
        }
    , Book
        { author = "Рэй Далио"
        , title = "Принципы"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/princzipyi/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/85/20585/0.50x-thumb.png"
        }
    , Book
        { author = "Ричард Пулин"
        , title = "Школа дизайна: макет"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/shkola-dizajna-maket/"
        , coverUrl = "https://www.mann-ivanov-ferber.ru/assets/images/covers/07/23307/0.50x-thumb.png"
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
    , BookTitle "Основы контентной стратегии"
    , BookTitle "Эмоциональный веб-дизайн"
    , BookTitle "Отзывчивый веб-дизайн"
    ]