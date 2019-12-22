package controllers

import dataset._

import javax.inject._
import play.api.mvc._

/**
 * This controller creates an `Action` to handle HTTP requests to the
 * application's home page.
 */
@Singleton
class HomeController @Inject()(cc: ControllerComponents) extends AbstractController(cc) {

  def programmer = Action {
    Ok(views.html.programmer(programmerData.nonCommercialProjects, programmerData.bookshelf))
  }

  def redirect404(anything: Any) = Action {
    Redirect("/")
  }

  def musician = Action {
    Ok(views.html.musician(musicianData.nonCommercialProjects, musicianData.bookshelf))
  }

}
