tell application "Music"
try
  set selectedMusic to selection
  set dialogAnswers to display dialog "Enter a increase play count" default answer "" 
  set addCount to text returned of dialogAnswers as integer
  if button returned of dialogAnswers is "OK" then
    repeat with m in selectedMusic
      set currentCount to played count of m 
      set played count of m to (currentCount + addCount)
    end repeat
  end if
end try
end tell