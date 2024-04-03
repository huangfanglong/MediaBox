/*
This project is created by:
Long Fang Huang / Long Phuong Huynh
*/

import QtQuick 2.12
import QtQml 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import com.llr.PlayerController 1.0

ApplicationWindow {
    id: mainWindow
    width: 1920
    height: 1080
    visible: true
    color: "black"
    title: qsTr("NetMovie")

  MovieInfoBox {
    id: firstMovie
    infoProvider {
        movieIndex: 0
        movieName: "Transformers: Rise of the Beasts (2023)"
        movieSynopsis: "Optimus Prime and the Autobots team up with a down on his luck young man, an aspiring historian and with a powerful faction of Transformers known as the Maximals to combat a sinister force from outer space that threatens the Earth and all of mankind."
        imageSource: "https://media-cache.cinematerial.com/p/500x/bxxnix91/transformers-rise-of-the-beasts-movie-poster.jpg?v=1682604149"
        videoSource: "qrc:assets/1.mp4"
    }
  }

  MovieInfoBox {
    id: secondMovie
    infoProvider {
        movieIndex: 1
        movieName: "Batman v Superman: Dawn of Justice (2016)"
        movieSynopsis: "It's been nearly two years since Superman's colossal battle with Zod devastated the city of Metropolis. The loss of life and collateral damage left many feeling angry and helpless, including crime-fighting billionaire Bruce Wayne. Convinced that Superman is now a threat to humanity, Batman embarks on a personal vendetta to end his reign on Earth, while the conniving Lex Luthor launches his own crusade against the Man of Steel."
        imageSource: "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/3348/33482342_sa.jpg;maxHeight=2000;maxWidth=2000"
        videoSource: "qrc:assets/2.mp4"
    }
  }

  MovieInfoBox {
    id: thirdMovie
    infoProvider {
        movieIndex: 2
        movieName: "John Wick: Chapter 4 (2023)"
        movieSynopsis: "With the price on his head ever increasing, legendary hit man John Wick takes his fight against the High Table global as he seeks out the most powerful players in the underworld, from New York to Paris to Japan to Berlin."
        imageSource: "https://media-cache.cinematerial.com/p/500x/npyfi8vj/john-wick-chapter-4-swiss-movie-poster.jpg?v=1678582234"
        videoSource: "qrc:assets/3.mp4"
    }
  }
  MovieInfoBox {
    id: fourthMovie
    infoProvider {
        movieIndex: 3
        movieName: "Avatar: The Way of Water (2022)"
        movieSynopsis: "Jake Sully and Ney'tiri have formed a family and are doing everything to stay together. However, they must leave their home and explore the regions of Pandora. When an ancient threat resurfaces, Jake must fight a difficult war against the humans."
        imageSource: "https://media-cache.cinematerial.com/p/500x/ayniyqcx/avatar-the-way-of-water-movie-poster.jpg?v=1667461543"
        videoSource: "qrc:assets/3.mp4"
    }
  }
  MovieInfoBox {
    id: fifthMovie
    infoProvider {
        movieIndex: 4
        movieName: "Code 8 (2019)"
        movieSynopsis: "A desperate young man with special powers commits a series of petty crimes and is hunted by a militarised police force."
        imageSource: "https://media-cache.cinematerial.com/p/500x/akwdoopr/code-8-movie-poster.jpg?v=1699474624"
        videoSource: "qrc:assets/3.mp4"
    }
  }
  MovieInfoBox {
    id: sixthMovie
    infoProvider {
        movieIndex: 5
        movieName: "Code 8 Part II (2024)"
        movieSynopsis: "In a city where people with powers are policed and oppressed, an ex-criminal must turn to a drug lord he despises to protect a teen from a corrupt cop."
        imageSource: "https://media-cache.cinematerial.com/p/500x/9eawsdnf/code-8-movie-poster.jpg?v=1705561576"
        videoSource: "qrc:assets/3.mp4"
    }
  }
  MovieInfoBox {
    id: seventhMovie
    infoProvider {
        movieIndex: 6
        movieName: "Avatar: The Last Airbender (2024)"
        movieSynopsis: "Set in an Asiatic, war-torn world where certain people can bend one of the four classical elements: water, earth, fire, or air. Aang is the Avatar, the only one capable of bending all the elements, and is destined to bring peace to the world from the Fire Nation."
        imageSource: "https://media-cache.cinematerial.com/p/500x/umvrbk0d/avatar-the-last-airbender-british-movie-poster.jpg?v=1705689124"
        videoSource: "qrc:assets/3.mp4"
    }
  }
  MovieInfoBox {
    id: eighthMovie
    infoProvider {
        movieIndex: 7
        movieName: "The Circle of Death (2023)"
        movieSynopsis: "Since Lamont Cranston - known to a select few as the Shadow - defeated Shiwan Khan and ended his reign of terror over New York one year ago, the city has started to regenerate. But there is evil brewing elsewhere. And this time the entire world is under threat."
        imageSource: "https://media-cache.cinematerial.com/p/500x/tofqdjhz/the-circle-of-death-movie-poster.jpg?v=1709225151"
        videoSource: "qrc:assets/3.mp4"
    }
  }
  MovieInfoBox {
    id: ninthMovie
    infoProvider {
        movieIndex: 8
        movieName: "X-Men: Apocalypse (2016)"
        movieSynopsis: "Worshiped as a god since the dawn of civilization, the immortal Apocalypse (Oscar Isaac) becomes the first and most powerful mutant. Awakening after thousands of years, he recruits the disheartened Magneto (Michael Fassbender) and other mutants to create a new world order. As the fate of the Earth hangs in the balance, Professor X (James McAvoy) and Raven (Jennifer Lawrence) lead a team of young X-Men to stop their seemingly invincible nemesis from destroying mankind."
        imageSource: "https://media-cache.cinematerial.com/p/500x/mb0isp2c/x-men-apocalypse-movie-poster.jpg?v=1464637182"
        videoSource: "qrc:assets/3.mp4"
    }
  }


  MovieSelectorFlow {
    firstMovieImage: {
    switch (PlayerController.currentMovieIndex) {
      case 0:
        return sixthMovie.infoProvider.imageSource
      case 1:
        return seventhMovie.infoProvider.imageSource
      case 2:
        return eighthMovie.infoProvider.imageSource
      case 3:
        return ninthMovie.infoProvider.imageSource
      case 4:
        return firstMovie.infoProvider.imageSource
      case 5:
        return secondMovie.infoProvider.imageSource
      case 6:
        return thirdMovie.infoProvider.imageSource
      case 7:
        return fourthMovie.infoProvider.imageSource
      case 8:
        return fifthMovie.infoProvider.imageSource
      }
    }
    secondMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return seventhMovie.infoProvider.imageSource
      case 1:
        return eighthMovie.infoProvider.imageSource
      case 2:
        return ninthMovie.infoProvider.imageSource
      case 3:
        return firstMovie.infoProvider.imageSource
      case 4:
        return secondMovie.infoProvider.imageSource
      case 5:
        return thirdMovie.infoProvider.imageSource
      case 6:
        return fourthMovie.infoProvider.imageSource
      case 7:
        return fifthMovie.infoProvider.imageSource
      case 8:
        return sixthMovie.infoProvider.imageSource
      }
    }
    thirdMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return eighthMovie.infoProvider.imageSource
      case 1:
        return ninthMovie.infoProvider.imageSource
      case 2:
        return firstMovie.infoProvider.imageSource
      case 3:
        return secondMovie.infoProvider.imageSource
      case 4:
        return thirdMovie.infoProvider.imageSource
      case 5:
        return fourthMovie.infoProvider.imageSource
      case 6:
        return fifthMovie.infoProvider.imageSource
      case 7:
        return sixthMovie.infoProvider.imageSource
      case 8:
        return seventhMovie.infoProvider.imageSource
      }
    }
    fourthMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return ninthMovie.infoProvider.imageSource
      case 1:
        return firstMovie.infoProvider.imageSource
      case 2:
        return secondMovie.infoProvider.imageSource
      case 3:
        return thirdMovie.infoProvider.imageSource
      case 4:
        return fourthMovie.infoProvider.imageSource
      case 5:
        return fifthMovie.infoProvider.imageSource
      case 6:
        return sixthMovie.infoProvider.imageSource
      case 7:
        return seventhMovie.infoProvider.imageSource
      case 8:
        return eighthMovie.infoProvider.imageSource
      }
    }
    fifthMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return firstMovie.infoProvider.imageSource
      case 1:
        return secondMovie.infoProvider.imageSource
      case 2:
        return thirdMovie.infoProvider.imageSource
      case 3:
        return fourthMovie.infoProvider.imageSource
      case 4:
        return fifthMovie.infoProvider.imageSource
      case 5:
        return sixthMovie.infoProvider.imageSource
      case 6:
        return seventhMovie.infoProvider.imageSource
      case 7:
        return eighthMovie.infoProvider.imageSource
      case 8:
        return ninthMovie.infoProvider.imageSource
      }
    }
    sixthMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return secondMovie.infoProvider.imageSource
      case 1:
        return thirdMovie.infoProvider.imageSource
      case 2:
        return fourthMovie.infoProvider.imageSource
      case 3:
        return fifthMovie.infoProvider.imageSource
      case 4:
        return sixthMovie.infoProvider.imageSource
      case 5:
        return seventhMovie.infoProvider.imageSource
      case 6:
        return eighthMovie.infoProvider.imageSource
      case 7:
        return ninthMovie.infoProvider.imageSource
      case 8:
        return firstMovie.infoProvider.imageSource
      }
    }
    seventhMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return thirdMovie.infoProvider.imageSource
      case 1:
        return fourthMovie.infoProvider.imageSource
      case 2:
        return fifthMovie.infoProvider.imageSource
      case 3:
        return sixthMovie.infoProvider.imageSource
      case 4:
        return seventhMovie.infoProvider.imageSource
      case 5:
        return eighthMovie.infoProvider.imageSource
      case 6:
        return ninthMovie.infoProvider.imageSource
      case 7:
        return firstMovie.infoProvider.imageSource
      case 8:
        return secondMovie.infoProvider.imageSource
      }
    }
    eighthMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return fourthMovie.infoProvider.imageSource
      case 1:
        return fifthMovie.infoProvider.imageSource
      case 2:
        return sixthMovie.infoProvider.imageSource
      case 3:
        return seventhMovie.infoProvider.imageSource
      case 4:
        return eighthMovie.infoProvider.imageSource
      case 5:
        return ninthMovie.infoProvider.imageSource
      case 6:
        return firstMovie.infoProvider.imageSource
      case 7:
        return secondMovie.infoProvider.imageSource
      case 8:
        return thirdMovie.infoProvider.imageSource
      }
    }
    ninthMovieImage: {
      switch (PlayerController.currentMovieIndex) {
      case 0:
        return fifthMovie.infoProvider.imageSource
      case 1:
        return sixthMovie.infoProvider.imageSource
      case 2:
        return seventhMovie.infoProvider.imageSource
      case 3:
        return eighthMovie.infoProvider.imageSource
      case 4:
        return ninthMovie.infoProvider.imageSource
      case 5:
        return firstMovie.infoProvider.imageSource
      case 6:
        return secondMovie.infoProvider.imageSource
      case 7:
        return thirdMovie.infoProvider.imageSource
      case 8:
        return fourthMovie.infoProvider.imageSource
      }
    }
  }
}


