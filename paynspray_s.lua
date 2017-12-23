local door1 = createObject(5422, 2072.5, -1831.4200244141, 16.5, 0, -90, 0)
local marker1 = createMarker(2063.5, -1831.1999511719, 13, "cylinder",8,225,225,255,0)
local isMoving = false
local moveTime = 1000
local doorDown = 5000

function repairVehicle ( thePlayer, commandName, vehicle) 
    setTimer ( function()
	if ( isPedInVehicle ( thePlayer ) ) then 
		local vehicle = getPedOccupiedVehicle(thePlayer)
		local money = getPlayerMoney(thePlayer)	
        if ( money >= 200 ) and  getElementHealth(vehicle) < 1000 then
			takePlayerMoney(thePlayer, 200)
            outputChatBox (" Your vehicle is restored. ", thePlayer, 0, 200, 0 )
			fixVehicle ( vehicle )
		elseif getElementHealth(vehicle) > 999 then
		outputChatBox ( "Your vehicle is already repaired." )
		elseif (money < 200) then
		outputChatBox ( "You don't have enough money for repairs." )
			else
            outputChatBox ( "Failed to fix your vehicle.", thePlayer) 
        end 
    else 
        outputChatBox ( "You're not in a vehicle!", thePlayer, 200, 0, 0 )  
	end
end, 5000, 1)
end
addEventHandler("onMarkerHit", marker1, repairVehicle)

function moveDoor(player, vehicle)
	if ( isPedInVehicle ( player ) ) then 
	local vehicle = getPedOccupiedVehicle(player)
	if isMoving then return end
	if source == marker1 then
		local move = moveObject(door1, moveTime, 2071.5, -1831.4000244141, 14.60000038147, 0, 90, 0)
		if move then 
			isMoving = false
			setTimer(moveDoor, moveTime, 1, true)
		end
	end
end
end
addEventHandler("onMarkerHit", marker1, moveDoor)

function door2(player, vehicle)
	setTimer(function() 
	if ( isPedInVehicle ( player ) ) then 
	local vehicle = getPedOccupiedVehicle(player)
	moveObject(door1, moveTime, 2072.5, -1831.4200244141, 16.5, 0, -90, 0)
		isMoving = false
end
end, 6000, 1)
end
addEventHandler("onMarkerHit", marker1, door2)

-- Changelog: Video 1 --
-- Video Notes: I changed the set timer to emulate the timer below it --
-- I changed the rotation from 270 to 90 degrees, no idea how it became 270 originally --
-- Made a new script to handle vehicle repairs --
-- Made the door go down and back up when hitting the marker --
-- Added delay to fixing the vehicle and when the door comes back up --

-- Changelog: Video 2 --
-- Made the cost take away money only if you have less than or equal to $200 --
-- paynspray only fixes vehicle if you have enough money --

-- Changelog: Video 3 --
-- Rebuilt the script in a different structure, ended up not needing too --
-- Rebuilt the current script to function as needed --
-- paynspray is now fully functional --
-- "add to video" showing all functions including not in vehicle --

-- Things to add --
-- After fixing the script add pay and spray sounds to accompany the immersion of the vehilce being fixed --
-- add paynspray sound effect --
