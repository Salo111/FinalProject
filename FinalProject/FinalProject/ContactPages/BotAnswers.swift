//
//  BotAnswers.swift
//  FinalProject
//
//  Created by salo khizanishvili on 14.09.22.
//

import Foundation

func GetBotAnswers(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hello, welcome to MC, i hope i can answer to your question"
    } else if tempMessage.contains("goodbye") {
        return "text us anytime <3"
    }
    else if tempMessage.contains("thank") {
            return "text us anytime <3"
    }
    else if tempMessage.contains("how are you") {
        return "thanks, how can i help you?"
    }
    else if tempMessage.contains("how can i rate movie") {
       return "you should open movie category and then you will see plus/minus buttons with movies list"
   }
    else if tempMessage.contains("How can i check movie as favourite"){
        return "on movies list page you will find heart sign, if you click, movie will be checked as favourite, if you click one more time, movie will be unchecked"
    }
    else if tempMessage.contains("Why should anyone register on MC") {
       return "because it is one of the biggest app, where you can find new movies, then watch, write reviews and rate them"
   }
    else if tempMessage.contains("Do you need an employee here") {
       return "not now, thanks"
   }
    
    else if tempMessage.contains("how many users MC have") {
       return "a lot"
   }
    else if tempMessage.contains("are not you going to add bookRate pages") {
       return "not now, but if we do, this will be another app"
   }
    else if tempMessage.contains("can i watch movies here") {
       return "you can not watch movies here"
   }
    else if tempMessage.contains("why Game Of Thrones is not in top 10 tv series") {
       return "seeriousllyy!???"
   }
    else if tempMessage.contains("what is MC"){
        return "Launched online in 1990 and a subsidiary of Amazon.com since 1998, MC is the world's most popular and authoritative source for movie content, designed to help fans explore the world of movies and decide what to watch."
    }
    else if tempMessage.contains("Partners") {
       return "our partners are: ERC, Famous Frames, MPA, MPTV, WGA, WireImage"
   }
    else if tempMessage.contains("How much does using MC cost") {
       return "MC is free "
   }
    else if tempMessage.contains("your phone number") {
       return "We don't offer phone support"
   }
    else {
        return "i can't answer, wait for the Boss to text you"
    }
}
