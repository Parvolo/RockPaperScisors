/* REXX */
/**********************************************************************/
/*REXX TO PLAY ROCK PAPER SCISSORS                                    */
/*                                                                    */
/**********************************************************************/
/*INITIATED                             29-08-2016            BIERMAP */
/**********************************************************************/
/* TRACE ?I */
/**********************************************************************/
/*MAIN EXEC START                                                     */
/**********************************************************************/
/*CLRSCRN*/
clear
CALL initiation
CALL bestofnum
DO bon
SAY ""
SAY "***Game " || gamecount || " of " || bon || ".***"
   CALL playrpc
SAY ""
gamecount = gamecount + 1
END
CALL wrapup
EXIT
/**********************************************************************/
/*MAIN EXEC END                                                       */
/**********************************************************************/
/**********************************************************************/
/*SUBROUTINES START                                                   */
/**********************************************************************/
/**************************/
/*SUBR PLAYERNAME START   */
/**************************/
playername:
SAY "Enter your player name:"
PULL playernamein
SAY "Your player name is: " || playernamein
RETURN
/**************************/
/*SUBR PLAYERNAME END     */
/**************************/
/**************************/
/*SUBR bestofnum START    */
/**************************/
bestofnum:
SAY "How many times do you want to play?"
PULL bon
RETURN
/**************************/
/*SUBR bestofnum END      */
/**************************/
/**************************/
/*SUBR playrpc START      */
/**************************/
playrpc:
SAY "Select ROCK, PAPER or SCISSORS"
PULL sel
CALL comp
CALL descision
RETURN
/**************************/
/*SUBR playrpc END        */
/**************************/
/**************************/
/*SUBR comp START         */
/**************************/
comp:
choice = RANDOM(2)
SELECT
WHEN choice = 0 THEN choice = "ROCK"
WHEN choice = 1 THEN choice = "PAPER"
WHEN choice = 2 THEN choice = "SCISSORS"
OTHERWISE
   SAY "ERROR!"
   EXIT
END
RETURN
/**************************/
/*SUBR comp END           */
/**************************/
/**************************/
/*SUBR descision START    */
/**************************/
descision:
SELECT
WHEN sel = "ROCK" & choice = "ROCK" THEN CALL tie
WHEN sel = "PAPER" & choice = "PAPER" THEN call tie
WHEN sel = "SCISSORS" & choice = "SCISSORS" THEN CALL tie
WHEN sel = "ROCK" & choice = "SCISSORS" THEN CALL win
WHEN sel = "PAPER" & choice = "ROCK" THEN CALL win
WHEN sel = "SCISSORS" & choice = "PAPER" THEN call win
OTHERWISE
   CALL lose
END
RETURN
/**************************/
/*SUBR desiscion END      */
/**************************/
/**************************/
/*SUBR tie START          */
/**************************/
tie:
SAY "You chose " || sel || "."
SAY "Computer chose " || choice || "."
tiecount = tiecount + 1
SAY "It's a tie! you have " || tiecount || " ties."
RETURN
/**************************/
/*SUBR tie END            */
/**************************/
/**************************/
/*SUBR win START          */
/**************************/
win:
SAY "You chose " || sel || "."
SAY "Computer chose " || choice || "."
wincount = wincount + 1
SAY sel || " beats " || choice || "! You win! " || wincount ||,
    " wins. How nice!"
RETURN
/**************************/
/*SUBR win END            */
/**************************/
/**************************/
/*SUBR lose START         */
/**************************/
lose:
SAY "You chose " || sel || "."
SAY "Computer chose " || choice || "."
losecount = losecount + 1
SAY choice || " beats " || sel || "! You are a loser! You lost " ||,
    losecount || " times. Shit happens."
RETURN
/**************************/
/*SUBR lose END           */
/**************************/
/**************************/
/*SUBR wrapup START       */
/**************************/
wrapup:
SAY "****** GAME OVER! ******"
SAY wincount || " wins, " || losecount || " loses, " || tiecount || " ties."
IF wincount > losecount THEN DO
SAY "You WIN, you lucky son of a bitch!"
END
IF wincount = losecount THEN DO
SAY "You have a TIE, haha fuck you."
END
IF wincount < losecount THEN DO
SAY "You LOSE! Go end your life."
END
SAY "****** GAME OVER! ******"
RETURN
/**************************/
/*SUBR wrapup END         */
/**************************/
/**************************/
/*SUBR HIGHSCORE START    */
/**************************/
/**************************/
/*SUBR HIGHSCORE END      */
/**************************/
/**************************/
/*SUBR INITIATION START   */
/**************************/
initiation:
gamecount = 1
tiecount = 0
wincount = 0
losecount = 0
RETURN
/**************************/
/*SUBR INITIATION END     */
/**************************/
/**********************************************************************/
/*SUBROUTINES END                                                     */
/**********************************************************************/