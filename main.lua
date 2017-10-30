----------------------------------------------------------------------------------------------
-- Title: Company Logo Animation
-- Name: Jack Wright
-- Date: October 30, 2017
-- Course: ICS2O/3C
-- 4 circles move towards the center of the screen. Logo fades in and spins. Plays sound
---------------------------------------------------------------------------------------------
--scroll speed variables
circle1ScrollSpeedX = 2
circle1ScrollSpeedY = 1
circle2ScrollSpeedX = 2
circle2ScrollSpeedY = 2
circle3ScrollSpeedX = 2
circle3ScrollSpeedY = 1
circle4ScrollSpeedX = 2
circle4ScrollSpeedY = 2

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-- sets the background colour
display.setDefault("background", 0, 0, 0)

-- draws logo
local logo = display.newImageRect("Images/appleLogo.png", 200, 200)
--draws circle 
local circle1 = display.newImageRect("Images/circle1.png", 350, 350)
--draws circle 
local circle2 = display.newImageRect("Images/circle2.png", 350, 350)
--draws circle 
local circle3 = display.newImageRect("Images/circle3.png", 350, 350)
--draws circle 
local circle4 = display.newImageRect("Images/circle4.png", 350, 350)

-- Background sound
local backgroundSound = audio.loadSound( "Sounds/Darkness.mp3" )
local backgroundSoundChannel

--sets logo location and opacity
logo.x = 500
logo.y = 230
logo.alpha = 0

-- sets circle location
circle2.x = 1000
circle2.y = 775

-- sets circle location
circle3.x = 1000
circle3.y = 0

-- sets circle location
circle4.x = 0
circle4.y = 775 

-- plays background sound
backgroundSoundChannel = audio.play(backgroundSound)

--fades in logo
local function FadeInLogo()
	logo.alpha = logo.alpha + .009
end

--spins logo
local function SpinLogo()
	if logo.rotation == 359 then
		return
	end
	logo.rotation = logo.rotation + 1
end
--stops sound
local function StopSound()
	audio.stop(backgroundSoundChannel)
	
end



--moves circles 1,2,3 and 4 diagonally towards the center of the screen and triggers functions SpinLogo and FadeInLogo
local function MoveCircles(event)
	circle2.x = circle2.x - circle2ScrollSpeedX
    circle2.y = circle2.y - circle2ScrollSpeedY
    circle3.x = circle3.x - circle3ScrollSpeedX
    circle3.y = circle3.y + circle3ScrollSpeedY
    circle1.x = circle1.x + circle1ScrollSpeedX
    circle1.y = circle1.y + circle1ScrollSpeedY
    circle4.x = circle4.x + circle4ScrollSpeedX
    circle4.y = circle4.y - circle4ScrollSpeedY
    timer.performWithDelay(4650, FadeInLogo)
    timer.performWithDelay(5800, SpinLogo)
    timer.performWithDelay(12000, StopSound)
end





--adds event listener to runtime each frame
Runtime:addEventListener("enterFrame", MoveCircles) 