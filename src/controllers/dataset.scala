package dataset

import model._

object musicianData {
  val bookshelf = List(
    Book("Aspen Pittman", "The Tube Amp Book - Deluxe Revised Edition", AMP, "https://www.halleonard.com/product/viewproduct.action?subsiteid=7&itemid=331091"),
    Book("Donald Brosnac", "Guitar Electronics for Musicians", ELECTRONICS, "https://www.amazon.com/Guitar-Electronics-Musicians-Donald-Brosnac/dp/0711902321"),
    Book("Hideo Kamimoto", "Complete Guitar Repair", MAINTAINANCE, "https://www.amazon.com/Complete-Guitar-Repair-Hideo-Kamimoto/dp/0825601568"),
    Book("Roger H. Siminoff", "The Luthier's Handbook", CONSTRUCTION, "https://straightupstrings.com/collections/books-and-drawings/products/the-luthiers-handbook"),
    Book("Paul Balmer (Author), Les Paul (Foreword)", "The Gibson Les Paul Handbook: How To Buy, Maintain, Set Up, Troubleshoot, and Modify Your Gibson and Epiphone Les Paul", MAINTAINANCE, "https://www.amazon.com/Gibson-Paul-Handbook-Maintain-Troubleshoot/dp/0760334706")
  )

  val nonCommercialProjects = List(
    Item("#FACFAF. Quick reference guide", 
      "A small book about Curtis Mayfield «Black Keys» Open F# guitar tuning.",
      List(
        Link("PDF", "https://www.gitbook.com/download/pdf/book/vladimirlogachev/facfaf"),
        Link("ePub", "https://www.gitbook.com/download/epub/book/vladimirlogachev/facfaf"),
        Link("Read online", "https://www.gitbook.com/read/book/vladimirlogachev/facfaf")
      ),
      "facfaf.jpg"
    )
  )
}

object programmerData {
  val bookshelf = List(
    Book("Miran Lipovača","Learn You a Haskell for Great Good!",HASKELL,"http://learnyouahaskell.com/"),
    Book("Professor Frisby","Mostly Adequate Guide to Functional Programming",JS,"https://mostly-adequate.gitbooks.io/mostly-adequate-guide/"),
    Book("Douglas Crockford","JavaScript: The Good Parts",JS,"http://shop.oreilly.com/product/9780596517748.do"),
    Book("Luis Atencio","Functional Programming in JavaScript",JS,"https://www.manning.com/books/functional-programming-in-javascript"),
    Book("Sam Newman","Building Microservices",DEV,"http://shop.oreilly.com/product/0636920033158.do"),
    Book("Alvin Alexander","Learning Functional Programming in Scala",SCALA,"https://alvinalexander.com/downloads/learning-fp-in-scala-0.1.1.pdf"),
    Book("Kyle Simpson","You Don't Know JS (book series) 1, 2, 3, 4",JS,"https://github.com/getify/You-Dont-Know-JS"),
    Book("Bruce Eckel, Dianne Marsh","Atomic Scala",SCALA,"http://www.atomicscala.com"),
    Book("Max P","React Router course for beginners",REACT,"https://www.gitbook.com/book/maxfarseer/react-router-course-ru"),
    Book("Max P","Redux course for beginners",REACT,"https://www.gitbook.com/book/maxfarseer/redux-course-ru"),
    Book("Robert Martin","Clean Code. A Handbook of Agile Software Craftsmanship",DEV,"http://www.pearsoned.co.uk/bookshop/detail.asp?item=100000000253077"),
    Book("Max P","React.js course for beginners",REACT,"https://www.gitbook.com/book/maxfarseer/react-course-ru"),
    Book("Stoyan Stefanov","JavaScript Patterns: Build Better Applications with Coding and Design Patterns",JS,"https://shop.oreilly.com/product/9780596806767.do"),
    Book("David Sawyer McFarland","CSS: The Missing Manual, 4th Edition",CSS,"https://shop.oreilly.com/product/0636920036357.do"),
    Book("Rebecca Hagen, Kim Golombisky","White Space Is Not Your Enemy: A beginner\"s guide to communicating visually through graphic, web and multimedia design",DESIGN,"http://cw.routledge.com/textbooks/9780240824147"),
    Book("Vlad Golovach","UI design-2. The art of elephant washing",DESIGN,"http://uibook2.usethics.ru"),
    Book("Artemy Lebedev","Mandership. Fourth Edition",DESIGN,"https://store.artlebedev.com/books/design/theory/kovodstvo4/"),
    Book("Erin Kissane","The Elements of Content Strategy",DESIGN,"https://abookapart.com/products/the-elements-of-content-strategy"),
    Book("Aarron Walter","Designing For Emotion",DESIGN,"https://abookapart.com/products/designing-for-emotion"),
    Book("Ethan Mascotte","Responsive Web Design",DESIGN,"https://abookapart.com/products/responsive-web-design")
  )

  val nonCommercialProjects = List(
    Item("Captain Million", 
      """An unfinished fullstack app, warehouse management system.
      Made in collaboration with K.S. Mai and Maxim Karabashev (both from Chingu community).
      My work is idea and frontend (partly). I am also responsible for failure (development has been stopped).""",
      List(
        Link("Live", "http://dev-captain-million.herokuapp.com/"),
        Link("GitHub", "https://github.com/Captain-Million"),
        Link("Chingu cohorts", "https://chingu-cohorts.github.io/chingu-directory/")
      ),
      "captain_million.png",
      List(
        TeamMate("K.S. Mai", 24501900, "https://ksmai.github.io/portfolio/"),
        TeamMate("Maxim Karabashev", 19782461, "https://github.com/mkarabashev")
      )
    ),
    Item("Lion Bot", 
      """A fullstack app, bot for Slack. 
      Made in collaboration with Josh Sanders, Michael Blood and Alex McLeod as a Build-To-Learn project (part of Chingu Cohorts workflow). 
      My work is Slack's «frontend» and app's landing page, but also I've made some contribution to the server.""",
      List(
        Link("Live", "http://lion-bot.herokuapp.com/"),
        Link("GitHub", "https://github.com/gang-of-four-lions/lion-bot"),
        Link("Chingu cohorts", "https://chingu-cohorts.github.io/chingu-directory/")
      ),
      "lionbot.jpg",
      List(
        TeamMate("Michael Blood", 12065896, "https://github.com/michaelblood"),
        TeamMate("Josh Sanders", 19422930, "https://github.com/Josh5231"),
        TeamMate("Alex McLeod", 24363605, "https://github.com/AlexMcLeod01")
      )
    )
  )
}
