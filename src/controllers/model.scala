package model

case class Item(name: String, description: String, links: List[Link], imgFileName: String = "", team: List[TeamMate] = List.empty)
case class Link(name: String, url: String)
case class Book(author: String, title: String, skills: Skill, url: String)
case class TeamMate(name: String, githubUserId: Int, url: String)

sealed abstract class Skill(name: String = "some other skill...") {
  override def toString = name
}
case object CONSTRUCTION extends Skill("Guitar construction")
case object MAINTAINANCE extends Skill("Guitar maintainance")
case object ELECTRONICS extends Skill("Guitar electronics")
case object AMP extends Skill("Amplification")
case object JS extends Skill("JavaScript")
case object HASKELL extends Skill("Haskell")
case object BS extends Skill("Bootstrap")
case object JQ extends Skill("jQuery")
case object SCALA extends Skill("Scala")
case object REACT extends Skill("React")
case object SASS extends Skill("SASS")
case object CSS extends Skill("CSS")
case object POSTCSS extends Skill("PostCSS")
case object WEBPACK extends Skill("Webpack")
case object DESIGN extends Skill("Design")
case object DEV extends Skill("Software Development")
