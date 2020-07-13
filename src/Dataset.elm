module Dataset exposing (..)

import Book exposing (..)
import Dict exposing (Dict)
import Language exposing (Language(..), enRu)
import Project exposing (..)


projects : Language -> List Project
projects lang =
    [ Project
        { name_i18n =
            enRu lang
                "Coming Soon: Russian Translation of “Scala with Cats”"
                "Скоро: Русский перевод книги «Scala with Cats»"
        , description_i18n =
            enRu lang
                """The book covers purely functional approach to software development in Scala. The translation is carried out together with my colleagues from FP Specialty."""
                """Книга описывает чисто функциональный подход к разработке приложений на Scala. Перевод осуществляется совместно с коллегами по FP Specialty."""
        , links =
            [ Link (enRu lang "Russian translation repo (WIP)" "Репозиторий перевода (в процессе)") "https://github.com/fpspecialty/scala-with-cats-ru"
            , Link (enRu lang "Original book" "Оригинал книги на английском") "https://underscore.io/books/scala-with-cats/"
            ]
        , imgFileName = Just "scala-with-cats.webp"
        , team =
            Team
                [ TeamMate "ivan-klass" (GitHubUserId 2673108) "https://github.com/ivan-klass"
                , TeamMate "Vladimir Nizamutdinov" (GitHubUserId 10260495) "https://github.com/astartes91"
                , TeamMate "BanyRule" (GitHubUserId 14077902) "https://github.com/banyrule"
                , TeamMate "AntonShtyrkin" (GitHubUserId 15253161) "https://github.com/AntonShtyrkin"
                , TeamMate "Erdemus" (GitHubUserId 5440901) "https://github.com/Erdemus"
                , TeamMate (enRu lang "other contributors" "остальные участники") NoPic "https://github.com/fpspecialty/scala-with-cats-ru/graphs/contributors"
                ]
        }
    , Project
        { name_i18n =
            enRu lang
                "Russian Translation of the “Mostly Adequate Guide to Functional Programming”"
                "Русский перевод книги «Mostly Adequate Guide to Functional Programming in JavaScript»"
        , description_i18n =
            enRu lang
                """The book introduces the reader to the functional programming paradigm and describes a functional approach to developing JavaScript applications.
                The translation was initiated by Maxim Filippov and stopped at 60%. Then me and Sakayama joined the translation, refactored every chapter translated before us and then finished the translation."""
                """Книга знакомит читателя с функциональной парадигмой программирования и описывает функциональный подход к разработке приложений на JavaScript.
                Работа по переводу была начата Максимом Филипповым и остановилась на 60%. Затем я и Sakayama присоединились к работе, переписали перевод каждой главы, выполненной до нас, а затем завершили перевод остальных глав."""
        , links =
            [ Link (enRu lang "Russian translation" "Книга на русском") "https://github.com/MostlyAdequate/mostly-adequate-guide-ru/blob/master/SUMMARY-ru.md"
            , Link (enRu lang "Original book" "Оригинал книги на английском") "https://mostly-adequate.gitbooks.io/mostly-adequate-guide/"
            ]
        , imgFileName = Just "mostly_adequate_guide_fp_ru.webp"
        , team =
            Team
                [ TeamMate "Maxim Filippov" (GitHubUserId 860283) "https://github.com/maksimf"
                , TeamMate "Sakayama" (GitHubUserId 44540001) "https://github.com/Sakayama"
                , TeamMate (enRu lang "other contributors" "остальные участники") NoPic "https://github.com/MostlyAdequate/mostly-adequate-guide-ru/graphs/contributors"
                ]
        }
    ]


{-| As long as I don't use relational database for this library, book title is a key.
To keep things consistent, title should be never changed :D
Also, there is no visible difference between Book and Course,
so I will store them all as "Books" for a while :D
-}
knownBooks : Dict String Book
knownBooks =
    [ Book
        { author = "Miran Lipovača"
        , title = "Learn You a Haskell for Great Good!"
        , topics = HASKELL
        , url = "http://learnyouahaskell.com/"
        , coverUrl = "learn_you_a_haskell.webp"
        , rating = Excellent
        }
    , Book
        { author = "Brian Lonsdorf"
        , title = "Mostly Adequate Guide to Functional Programming"
        , topics = JS
        , url = "https://mostly-adequate.gitbooks.io/mostly-adequate-guide/"
        , coverUrl = "mostly_adequate_guide_fp_ru.webp"
        , rating = Excellent
        }
    , Book
        { author = "Douglas Crockford"
        , title = "JavaScript: The Good Parts"
        , topics = JS
        , url = "http://shop.oreilly.com/product/9780596517748.do"
        , coverUrl = "js_good_parts.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Luis Atencio"
        , title = "Functional Programming in JavaScript"
        , topics = JS
        , url = "https://www.manning.com/books/functional-programming-in-javascript"
        , coverUrl = "fp_in_js.webp"
        , rating = Excellent
        }
    , Book
        { author = "Sam Newman"
        , title = "Building Microservices"
        , topics = DEV
        , url = "http://shop.oreilly.com/product/0636920033158.do"
        , coverUrl = "building_microservices.webp"
        , rating = Excellent
        }
    , Book
        { author = "Alvin Alexander"
        , title = "Learning Functional Programming in Scala"
        , topics = SCALA
        , url = "https://alvinalexander.com/downloads/learning-fp-in-scala-0.1.1.pdf"
        , coverUrl = "alvin_scala.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Kyle Simpson"
        , title = "You Don't Know JS (book series) 1, 2, 3, 4"
        , topics = JS
        , url = "https://github.com/getify/You-Dont-Know-JS"
        , coverUrl = "ydkjs.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Bruce Eckel, Dianne Marsh"
        , title = "Atomic Scala"
        , topics = SCALA
        , url = "http://www.atomicscala.com"
        , coverUrl = "atomic_scala.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Robert Martin"
        , title = "Clean Code. A Handbook of Agile Software Craftsmanship"
        , topics = DEV
        , url = "https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship-ebook/dp/B001GSTOAM"
        , coverUrl = "clean_code.webp"
        , rating = Excellent
        }
    , Book
        { author = "Максим Пацианский"
        , title = "Роутинг в react-приложениях"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/react-router-course-ru/content"
        , coverUrl = "router.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Максим Пацианский"
        , title = "React Redux курс для начинающих"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/redux-course-ru-v2/content/"
        , coverUrl = "redux.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Максим Пацианский"
        , title = "React.js курс для начинающих"
        , topics = JS
        , url = "https://maxfarseer.gitbooks.io/react-course-ru-v2/content/"
        , coverUrl = "react_beginners.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Stoyan Stefanov"
        , title = "JavaScript Patterns: Build Better Applications with Coding and Design Patterns"
        , topics = JS
        , url = "https://shop.oreilly.com/product/9780596806767.do"
        , coverUrl = "js_patterns.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "David Sawyer McFarland"
        , title = "CSS: The Missing Manual"
        , topics = CSS
        , url = "https://shop.oreilly.com/product/0636920036357.do"
        , coverUrl = "css3.webp"
        , rating = Excellent
        }
    , Book
        { author = "Rebecca Hagen, Kim Golombisky"
        , title = "White Space Is Not Your Enemy"
        , topics = DESIGN
        , url = "http://cw.routledge.com/textbooks/9780240824147"
        , coverUrl = "wsinye.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Артемий Лебедев"
        , title = "Ководство"
        , topics = DESIGN
        , url = "https://www.artlebedev.ru/kovodstvo/sections/"
        , coverUrl = "kovodstvo.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Эрин Киссейн"
        , title = "Основы контентной стратегии"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/book-apart/elements-content-strategy/"
        , coverUrl = "content_strategy.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Аарон Уолтер"
        , title = "Эмоциональный веб-дизайн"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/book-apart/emotional-web-design/"
        , coverUrl = "emotional_design.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Итан Маркотт"
        , title = "Отзывчивый веб-дизайн"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/book-apart/otzivchivij-web-design/"
        , coverUrl = "responsive_design.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Aspen Pittman"
        , title = "The Tube Amp Book - Deluxe Revised Edition"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Tube-Amp-Book-Deluxe-Revised/dp/0879307676"
        , coverUrl = "tube_amp.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Donald Brosnac"
        , title = "Guitar Electronics for Musicians"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Guitar-Electronics-Musicians-Donald-Brosnac/dp/0711902321"
        , coverUrl = "guitar_electronics.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Hideo Kamimoto"
        , title = "Complete Guitar Repair"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Complete-Guitar-Repair-Hideo-Kamimoto/dp/0825601568"
        , coverUrl = "guitar_repair.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Roger H. Siminoff"
        , title = "The Luthier's Handbook"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://straightupstrings.com/collections/books-and-drawings/products/the-luthiers-handbook"
        , coverUrl = "luthiers_handbook.webp"
        , rating = Excellent
        }
    , Book
        { author = "Paul Balmer"
        , title = "The Gibson Les Paul Handbook"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.amazon.com/Gibson-Paul-Handbook-Maintain-Troubleshoot/dp/0760334706"
        , coverUrl = "lespaul_handbook.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides"
        , title = "Design Patterns: Elements of Reusable Object-Oriented Software"
        , topics = DEV
        , url = "https://www.amazon.com/Design-Patterns-Object-Oriented-Addison-Wesley-Professional-ebook/dp/B000SEIBB8"
        , coverUrl = "gof.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Pat Brisbin"
        , title = "Maybe Haskell"
        , topics = HASKELL
        , url = "https://books.thoughtbot.com/assets/maybe-haskell.pdf"
        , coverUrl = "maybe_haskell.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Harold Abelson, Gerald Jay Sussman, Julie Sussman"
        , title = "Structure and Interpretation of Computer Programs"
        , topics = SCHEME
        , url = "https://www.amazon.com/Structure-Interpretation-Computer-Programs-Engineering/dp/0262510871"
        , coverUrl = "sicp.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Bartosz Milewski"
        , title = "Category Theory for Programmers"
        , topics = HASKELL
        , url = "https://github.com/hmemcpy/milewski-ctfp-pdf"
        , coverUrl = "category_theory_for_programmers.webp"
        , rating = Excellent
        }
    , Book
        { author = "Noel Welsh, Dave Gurnell"
        , title = "Essential Scala"
        , topics = SCALA
        , url = "https://underscore.io/books/essential-scala/"
        , coverUrl = "essential-scala.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Noel Welsh, Dave Gurnell"
        , title = "Scala with Cats"
        , topics = SCALA
        , url = "https://underscore.io/books/scala-with-cats/"
        , coverUrl = "scala-with-cats.webp"
        , rating = Excellent
        }
    , Book
        { author = "Vitaly Bragilevsky"
        , title = "Haskell in Depth"
        , topics = HASKELL
        , url = "https://www.manning.com/books/haskell-in-depth"
        , coverUrl = "haskell_in_depth.webp"
        , rating = Excellent
        }
    , Book
        { author = "Дэйв Логан, Джон Кинг, Хэли Фишер-Райт"
        , title = "Лидер и племя"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/lider-i-plemya/"
        , coverUrl = "leader.webp"
        , rating = Excellent
        }
    , Book
        { author = "Фредерик Лалу"
        , title = "Открывая организации будущего"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/novyj-vzglyad-na-organizacii/"
        , coverUrl = "reinventing_organizations.webp"
        , rating = Excellent
        }
    , Book
        { author = "Питер Брегман"
        , title = "Эмоциональная смелость"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/emoczionalnaya-smelost/"
        , coverUrl = "emotional.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Джон Хеннесси"
        , title = "Принципы лидера"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/princzipyi-lidera/"
        , coverUrl = "leader_principles.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Ричард Пулин"
        , title = "Школа дизайна: шрифт"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/shkola-dizajna-shrift/"
        , coverUrl = "type.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Кейт Феррацци, Тал Рэз"
        , title = "Никогда не ешьте в одиночку"
        , topics = COMMUNICATION
        , url = "https://www.mann-ivanov-ferber.ru/books/mif/nevereatalone/"
        , coverUrl = "never_eat_alone.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Джон Дорр"
        , title = "Измеряйте самое важное"
        , topics = MANAGEMENT
        , url = "https://www.mann-ivanov-ferber.ru/books/izmeryajte-samoe-vazhnoe/"
        , coverUrl = "measure_what_matters.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Рэй Далио"
        , title = "Принципы"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/princzipyi/"
        , coverUrl = "dalio_principles.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Ричард Пулин"
        , title = "Школа дизайна: макет"
        , topics = DESIGN
        , url = "https://www.mann-ivanov-ferber.ru/books/shkola-dizajna-maket/"
        , coverUrl = "layout.webp"
        , rating = Unknown
        }
    , Book
        { author = "Максим Котин"
        , title = "И ботаники делают бизнес 1+2"
        , topics = ENTREPRENEURSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/i_botaniki_delayut_biznes_2/"
        , coverUrl = "botaniki.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Эмилио Пухоль"
        , title = "Школа игры на шестиструнной гитаре"
        , topics = MUSIC_INSTRUMENTS
        , url = "https://www.chitai-gorod.ru/catalog/book/358478/"
        , coverUrl = "pujol.webp"
        , rating = WorthReading
        }
    , Book
        { author = "freeCodeCamp"
        , title = "Frontend Developer Specialization"
        , topics = JS
        , url = "https://www.freecodecamp.org/"
        , coverUrl = "freecodecamp.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Денис Москвин, Computer Science Center"
        , title = "Функциональное программирование на языке Haskell"
        , topics = HASKELL
        , url = "https://stepik.org/course/75"
        , coverUrl = "stepik_haskell.webp"
        , rating = Excellent
        }
    , Book
        { author = "Денис Москвин, Computer Science Center"
        , title = "Функциональное программирование на языке Haskell (часть 2)"
        , topics = HASKELL
        , url = "https://stepik.org/course/693"
        , coverUrl = "stepik_haskell.webp"
        , rating = Excellent
        }
    , Book
        { author = "Tinkoff.ru"
        , title = "Введение в Scala"
        , topics = SCALA
        , url = "https://stepik.org/course/16243"
        , coverUrl = "tinkoff_scala.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Samuel Gélineau"
        , title = "Mastering Haskell Programming"
        , topics = HASKELL
        , url = "https://www.udemy.com/course/mastering-haskell-programming/"
        , coverUrl = "mastering_haskell_programming.webp"
        , rating = WorthReading
        }
    , Book
        { author = "Бернхард Ретцель"
        , title = "Джентльмен. Путеводитель по стилю и моде для мужчин"
        , topics = FASHION
        , url = "https://www.ozon.ru/context/detail/id/4993260/"
        , coverUrl = "gentleman.webp"
        , rating = NothingSpecial
        }
    , Book
        { author = "Айн Рэнд"
        , title = "Ночью 16 января; Идеал; Подумай дважды"
        , topics = FICTION
        , url = "https://ast.ru/book/nochyu-16-yanvarya-ideal-podumay-dvazhdy-028758/"
        , coverUrl = "three_plays.jpg"
        , rating = Unknown
        }
    , Book
        { author = "Айн Рэнд"
        , title = "Источник"
        , topics = FICTION
        , url = "https://www.alpinabook.ru/catalog/book-66478/"
        , coverUrl = "the_fountainhead.jpg"
        , rating = Excellent
        }
    , Book
        { author = "Айн Рэнд"
        , title = "Атлант расправил плечи"
        , topics = FICTION
        , url = "https://www.alpinabook.ru/catalog/book-65392/"
        , coverUrl = "atlas_shrugged.jpg"
        , rating = Excellent
        }
    , Book
        { author = "Айн Рэнд"
        , title = "Гимн"
        , topics = FICTION
        , url = "https://www.alpinabook.ru/catalog/book-61335/"
        , coverUrl = "anthem.jpg"
        , rating = WorthReading
        }
    , Book
        { author = "Джон Чемберс"
        , title = "Соединяя точки"
        , topics = LEADERSHIP
        , url = "https://www.mann-ivanov-ferber.ru/books/soedinyaya-tochki/"
        , coverUrl = "connecting_dots.png"
        , rating = WorthReading
        }
    , Book
        { author = "Харвилл Хендрикс и Хелен Хант"
        , title = "Любовь на всю жизнь"
        , topics = RELATIONS
        , url = "https://www.mann-ivanov-ferber.ru/books/lyubov-na-vsyu-zhizn/"
        , coverUrl = "love_you_want.png"
        , rating = Excellent
        }
    , Book
        { author = "Рада Агравал"
        , title = "Вместе"
        , topics = COMMUNICATION
        , url = "https://www.mann-ivanov-ferber.ru/books/vmeste/"
        , coverUrl = "together.png"
        , rating = WorthReading
        }
    , Book
        { author = "Эмбер Рэй"
        , title = "Вся правда обо мне"
        , topics = COMMUNICATION
        , url = "https://www.mann-ivanov-ferber.ru/books/vsya-pravda-obo-mne/"
        , coverUrl = "truth_about_me.png"
        , rating = Unknown
        }
    , Book
        { author = "Авинаш Диксит и Барри Нейлбафф"
        , title = "Теория игр"
        , topics = MANAGEMENT
        , url = "https://www.mann-ivanov-ferber.ru/books/strategicheskoe_mishlenie/"
        , coverUrl = "game_theory.png"
        , rating = Unknown
        }
    , Book
        { author = "Энн Джензер"
        , title = "Как писать нон-фикшн"
        , topics = TEXT
        , url = "https://www.mann-ivanov-ferber.ru/books/kak-pisat-non-fikshn/"
        , coverUrl = "non_fiction.png"
        , rating = Unknown
        }
    , Book
        { author = "Нассим Николас Талеб"
        , title = "Черный лебедь. Под знаком непредсказуемости"
        , topics = MANAGEMENT
        , url = "https://azbooka.ru/books/chernyy-lebed-pod-znakom-nepredskazuemosti-2-e-izd-dopolnennoe-s1va"
        , coverUrl = "black_swan.jpg"
        , rating = WorthReading
        }
    , Book
        { author = "Алекс Бэнкс, Ева Порселло"
        , title = "GraphQL: язык запросов для современных веб-приложений"
        , topics = DEV
        , url = "https://www.piter.com/collection/programmirovanie-razrabotka-programnogo-obespecheniya/product/graphql-yazyk-zaprosov-dlya-sovremennyh-veb-prilozheniy"
        , coverUrl = "graphql.jpg"
        , rating = WorthReading
        }
    , Book
        { author = "Евгений Моргунов"
        , title = "PostgreSQL. Основы языка SQL"
        , topics = DEV
        , url = "https://bhv.ru/product/postgresql-osnovy-yazyka-sql/"
        , coverUrl = "postgres.jpg"
        , rating = WorthReading
        }
    , Book
        { author = "Алексей Локонцев"
        , title = "История одного мирового бренда"
        , topics = ENTREPRENEURSHIP
        , url = "https://topgunbarber.ru/book/"
        , coverUrl = "topgun.jpg"
        , rating = Unknown
        }
    ]
        |> List.map (\((Book { title }) as book) -> ( title, book ))
        |> Dict.fromList



{- if book is not found in states Dict, then it is not in Library :D -}


libraryState : Dict String BookAvaliability
libraryState =
    Dict.fromList
        [ ( "Лидер и племя", AlreadyTaken )
        , ( "Открывая организации будущего", AlreadyTaken )
        , ( "Эмоциональная смелость", AlreadyTaken )
        , ( "Принципы лидера", AlreadyTaken )
        , ( "Школа дизайна: шрифт", Available )
        , ( "Никогда не ешьте в одиночку", Available )
        , ( "Измеряйте самое важное", AlreadyTaken )
        , ( "Принципы", AlreadyTaken )
        , ( "Школа дизайна: макет", AlreadyTaken )
        , ( "Haskell in Depth", ComingSoon )
        , ( "The Tube Amp Book - Deluxe Revised Edition", Available )
        , ( "Guitar Electronics for Musicians", Available )
        , ( "Complete Guitar Repair", Available )
        , ( "The Luthier's Handbook", Available )
        , ( "The Gibson Les Paul Handbook", Available )
        , ( "Джентльмен. Путеводитель по стилю и моде для мужчин", Available )
        , ( "И ботаники делают бизнес 1+2", AlreadyTaken )
        , ( "Школа игры на шестиструнной гитаре", Available )
        , ( "Ночью 16 января; Идеал; Подумай дважды", ComingSoon )
        , ( "Источник", Available )
        , ( "Атлант расправил плечи", AlreadyTaken )
        , ( "Гимн", Available )
        , ( "Соединяя точки", Available )
        , ( "Любовь на всю жизнь", AlreadyTaken )
        , ( "Вместе", AlreadyTaken )
        , ( "Вся правда обо мне", Available )
        , ( "Теория игр", ComingSoon )
        , ( "Как писать нон-фикшн", ComingSoon )
        , ( "Черный лебедь. Под знаком непредсказуемости", ComingSoon )
        , ( "GraphQL: язык запросов для современных веб-приложений", AlreadyTaken )
        , ( "PostgreSQL. Основы языка SQL", AlreadyTaken )
        , ( "История одного мирового бренда", ComingSoon )
        ]


learningPath : List LearningMaterial
learningPath =
    [ BookTitle "Scala with Cats"
    , BookTitle "Essential Scala"
    , BookTitle "Category Theory for Programmers"
    , BookTitle "Введение в Scala"
    , BookTitle "Structure and Interpretation of Computer Programs"
    , BookTitle "Mastering Haskell Programming"
    , BookTitle "Функциональное программирование на языке Haskell (часть 2)"
    , BookTitle "Функциональное программирование на языке Haskell"
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
    , BookTitle "Frontend Developer Specialization"
    , BookTitle "CSS: The Missing Manual"
    , BookTitle "White Space Is Not Your Enemy"
    , BookTitle "Ководство"
    , BookTitle "Основы контентной стратегии"
    , BookTitle "Эмоциональный веб-дизайн"
    , BookTitle "Отзывчивый веб-дизайн"
    ]
