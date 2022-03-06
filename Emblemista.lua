local NpcId =  200007   --> El ID del NPC que correrá el script
local Tri,Con,Val,Her,Esc = 47241,45624,40753,40752,49426  --> Dejé el ID del Emblema de escarcha por si se agrega más adelante.
local Strings = {'¡Hagamos negocios más seguido!','¡Listo! Vuelve pronto.','¡Hecho! ¿algún otro cambio?','¡Buen trueque, regresa pronto!','¡Cuida tus nuevos emblemas!','Intercambio exitoso!'}
-----------------------------------------------------------------------------------------------------------------------------------------------------
local function OnGossipHello(E,P,U)
    P:GossipClearMenu()
    P:GossipMenuAddItem(0, "Quiero Emblemas de Triunfo.", 100, 1)
    P:GossipMenuAddItem(0, "Quiero Emblemas de Conquista.", 100, 2)
    P:GossipMenuAddItem(0, "Quiero Emblemas de Valor.", 100, 3)
    P:GossipMenuAddItem(0, "Quiero Emblemas de Heroísmo.", 100, 4)
    P:GossipSendMenu(1, U, MenuId)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
local function Do(K,Cod,PL,UN,EV)
        if K== 5 then B=Tri A=Con end   if K== 6 then B=Tri A=Val end   if K== 7 then B=Tri A=Her end
        if K== 8 then B=Con A=Tri end   if K== 9 then B=Con A=Val end   if K==10 then B=Con A=Her end
        if K==11 then B=Val A=Tri end   if K==12 then B=Val A=Con end   if K==13 then B=Val A=Her end
        if K==14 then B=Her A=Tri end   if K==15 then B=Her A=Con end   if K==16 then B=Her A=Val end
    if Cod <= 0 then 
            UN:SendUnitSay('"'..Cod..'"'..'no es un número válido.',0) PL:GossipComplete()
        else 
            if PL:HasItem(A, Cod) then PL:RemoveItem(A, Cod) PL:AddItem(B, Cod) local ran = math.random(1,6) UN:SendUnitSay(Strings[ran], 0)
                PL:GossipComplete()
            else
                UN:SendUnitSay("No tienes ese tipo o cantidad de emblemas.", 0) PL:GossipComplete() end 
        end 
    end
-----------------------------------------------------------------------------------------------------------------------------------------------------
local function OnGossipSelect(E, P, U, sender, intid, code, menuid) 

    if (intid == 1) then -- Triunfo A:
        P:GossipMenuAddItem(4, "Por mis Emblemas de Conquista.", 5, 5, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Valor.", 6, 6, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Heroísmo.", 7, 7, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end

    if (intid == 2) then -- Conquista A:
        P:GossipMenuAddItem(4, "Por mis Emblemas de Triunfo.", 8, 8, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Valor.", 9, 9, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Heroísmo.", 10, 10, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end

    if (intid == 3) then -- Valor A:
        P:GossipMenuAddItem(4, "Por mis Emblemas de Triunfo.", 11, 11, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Conquista.", 12, 12, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Heroísmo.", 13, 13, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end

    if (intid == 4) then -- Heroísmo A:
        P:GossipMenuAddItem(4, "Por mis Emblemas de Triunfo.", 14, 14, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Conquista.", 15, 15, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de Valor.", 16, 16, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end
-----------------------------------------------------------------------------------------------------------------------------------------------------
    if (sender == 0) then OnGossipHello(E, P, U) end    
    if sender >= 5 and sender ~= 100 then Do(sender,tonumber(code),P,U,E) end    
-----------------------------------------------------------------------------------------------------------------------------------------------------
end
RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)