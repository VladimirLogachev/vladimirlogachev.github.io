module Dataset exposing (..)

import Book exposing (..)
import Project exposing (..)


bookshelf : List Book
bookshelf =
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
        { author = "Max P"
        , title = "React Router course for beginners"
        , topics = REACT
        , url = "https://www.gitbook.com/book/maxfarseer/react-router-course-ru"
        }
    , Book
        { author = "Max P"
        , title = "Redux course for beginners"
        , topics = REACT
        , url = "https://www.gitbook.com/book/maxfarseer/redux-course-ru"
        }
    , Book
        { author = "Robert Martin"
        , title = "Clean Code. A Handbook of Agile Software Craftsmanship"
        , topics = DEV
        , url = "http://www.pearsoned.co.uk/bookshop/detail.asp?Project=100000000253077"
        }
    , Book
        { author = "Max P"
        , title = "React.js course for beginners"
        , topics = REACT
        , url = "https://www.gitbook.com/book/maxfarseer/react-course-ru"
        }
    , Book
        { author = "Stoyan Stefanov"
        , title = "JavaScript Patterns: Build Better Applications with Coding and Design Patterns"
        , topics = JS
        , url = "https://shop.oreilly.com/product/9780596806767.do"
        }
    , Book
        { author = "David Sawyer McFarland"
        , title = "CSS: The Missing Manual, 4th Edition"
        , topics = CSS
        , url = "https://shop.oreilly.com/product/0636920036357.do"
        }
    , Book
        { author = "Rebecca Hagen, Kim Golombisky"
        , title = "White Space Is Not Your Enemy: A beginner's guide to communicating visually through graphic, web and multimedia design"
        , topics = DESIGN
        , url = "http://cw.routledge.com/textbooks/9780240824147"
        }
    , Book
        { author = "Vlad Golovach"
        , title = "UI design-2. The art of elephant washing"
        , topics = DESIGN
        , url = "http://uibook2.usethics.ru"
        }
    , Book
        { author = "Artemy Lebedev"
        , title = "Mandership. Fourth Edition"
        , topics = DESIGN
        , url = "https://store.artlebedev.com/books/design/theory/kovodstvo4/"
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
        , topics = ELECTRONICS
        , url = "https://www.halleonard.com/product/viewproduct.action?subsiteid=7&Projectid=331091"
        }
    , Book
        { author = "Donald Brosnac"
        , title = "Guitar Electronics for Musicians"
        , topics = ELECTRONICS
        , url = "https://www.amazon.com/Guitar-Electronics-Musicians-Donald-Brosnac/dp/0711902321"
        }
    , Book
        { author = "Hideo Kamimoto"
        , title = "Complete Guitar Repair"
        , topics = MAINTAINANCE
        , url = "https://www.amazon.com/Complete-Guitar-Repair-Hideo-Kamimoto/dp/0825601568"
        }
    , Book
        { author = "Roger H. Siminoff"
        , title = "The Luthier's Handbook"
        , topics = CONSTRUCTION
        , url = "https://straightupstrings.com/collections/books-and-drawings/products/the-luthiers-handbook"
        }
    , Book
        { author = "Paul Balmer (Author), Les Paul (Foreword)"
        , title = "The Gibson Les Paul Handbook: How To Buy, Maintain, Set Up, Troubleshoot, and Modify Your Gibson and Epiphone Les Paul"
        , topics = MAINTAINANCE
        , url = "https://www.amazon.com/Gibson-Paul-Handbook-Maintain-Troubleshoot/dp/0760334706"
        }
    ]


projects : List Project
projects =
    [ Project "Translation of the Mostly Adequate Guide"
        """Russian version of the Mostly Adequate Guide to Functional Programming in JavaScript by Brian Lonsdorf.
      The translation was initiated by Maxim Filippov and stopped at 60%.
      Then me and Sakayama joined the translation, refactored every chapter translated before us and then finished the translation."""
        [ Link "Russian translation" "https://github.com/MostlyAdequate/mostly-adequate-guide-ru/blob/master/SUMMARY-ru.md"
        , Link "Original book" "https://mostly-adequate.gitbooks.io/mostly-adequate-guide/"
        ]
        (Just "mostly_adequate_guide_fp_ru.png")
        (Team
            [ TeamMate "Maxim Filippov" (GitHubUserpic { githubUserId = 860283 }) "https://github.com/maksimf"
            , TeamMate "Sakayama" (GitHubUserpic { githubUserId = 44540001 }) "https://github.com/Sakayama"
            , TeamMate "other contributors" NoPic "https://github.com/MostlyAdequate/mostly-adequate-guide-ru/graphs/contributors"
            ]
        )
    , Project
        "#FACFAF. Quick reference guide"
        "A small book about Curtis Mayfield «Black Keys» Open F# guitar tuning."
        [ Link "PDF" "https://www.gitbook.com/download/pdf/book/vladimirlogachev/facfaf"
        , Link "ePub" "https://www.gitbook.com/download/epub/book/vladimirlogachev/facfaf"
        , Link "Read online" "https://www.gitbook.com/read/book/vladimirlogachev/facfaf"
        ]
        (Just "facfaf.jpg")
        OnlyMe
    , Project "Lion Bot"
        """A fullstack app, bot for Slack.
      Made in collaboration as a Build-To-Learn project (part of Chingu Cohorts workflow).
      My work is Slack's «frontend» and app's landing page, but also I've made some contribution to the server."""
        [ Link "Live" "http://lion-bot.herokuapp.com/"
        , Link "GitHub" "https://github.com/gang-of-four-lions/lion-bot"
        , Link "Chingu" "https://chingu.io/"
        ]
        (Just "lionbot.jpg")
        (Team
            [ TeamMate "Michael Blood" (GitHubUserpic { githubUserId = 12065896 }) "https://github.com/michaelblood"
            , TeamMate "Josh Sanders" (GitHubUserpic { githubUserId = 19422930 }) "https://github.com/Josh5231"
            , TeamMate "Alex McLeod" (GitHubUserpic { githubUserId = 24363605 }) "https://github.com/AlexMcLeod01"
            ]
        )
    ]
