local door1 = createObject(5422, 2072.5, -1831.4200244141, 16.5, 0, -90, 0)
local marker1 = createMarker(2063.5, -1831.1999511719, 13, "cylinder",8,225,225,255,0)
local isMoving = false
local moveTime = 1000
local doorDown = 5000

function repairVehicle ( thePlayer, commandName) 
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
addEventHandler("onMarkerHit", root, repairVehicle)

function moveDoor(player)
	if isMoving then return end
	if source == marker1 then
		local move = moveObject(door1, moveTime, 2071.5, -1831.4000244141, 14.60000038147, 0, 90, 0)
		if move then 
			isMoving = false
			setTimer(moveDoor, moveTime, 1, true)
		end
	end
end
addEventHandler("onMarkerHit", root, moveDoor)

function door2()
	setTimer(function() 
	moveObject(door1, moveTime, 2072.5, -1831.4200244141, 16.5, 0, -90, 0)
		isMoving = false
end, 6000, 1)
end 
addEventHandler("onMarkerHit", root, door2)