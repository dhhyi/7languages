"---------------" println

postOffice := Object clone

postOffice packageSender := method(call sender)

mailer := Object clone

mailer deliver := method(postOffice packageSender)

// mailer deliver() println

postOffice messageTarget := method(call target)

// postOffice messageTarget println

postOffice messageArgs := method(call message arguments)

postOffice messageName := method(call message name)

// postOffice messageArgs("one", 2, :three) println
// postOffice messageName("one", 2, :three) println

unless := method(
    if(call sender doMessage(call message argAt(0))) ifFalse(call sender doMessage(call message argAt(1))) ifTrue(call sender doMessage(call message argAt(2)))
)


unless(1 == 1, ("false path" println), ("true path" println)) println
