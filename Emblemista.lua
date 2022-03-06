--[[    Ariel Camilo // ariel.cami@gmail.com  // 6 de Marzo 2022

        Ten en cuenta que si activas el trueque de Escarchas, ya no será necesario hacer ICC/Voa/SR/Diaria,
        porque los emblemas que se consigan farmeando se podrán cambiar por Escarchas.
]]

local NpcId =  00000   --> Reemplaza 00000 por el ID del NPC que correrá el script
local Tri,Con,Val,Her,Esc = 47241,45624,40753,40752,49426  --> Para activar el trueque con Escarchas, solo borra donde veas "-->>"
local Strings = {'¡Hagamos negocios más seguido!','¡Listo! Vuelve pronto.','¡Hecho! ¿algún otro cambio?','¡Buen trueque, regresa pronto!','¡Cuida tus nuevos emblemas!','Intercambio exitoso!'}
-----------------------------------------------------------------------------------------------------------------------------------------------------
local function OnGossipHello(E,P,U)
    P:GossipClearMenu()
    -->>P:GossipMenuAddItem(0, "Quiero Emblemas de escarcha.", 100, 20)
    P:GossipMenuAddItem(0, "Quiero Emblemas de triunfo.", 100, 1)
    P:GossipMenuAddItem(0, "Quiero Emblemas de conquista.", 100, 2)
    P:GossipMenuAddItem(0, "Quiero Emblemas de valor.", 100, 3)
    P:GossipMenuAddItem(0, "Quiero Emblemas de heroísmo.", 100, 4)
    P:GossipSendMenu(1, U, MenuId)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
local function Do(K,Cod,PL,UN,EV)
        if K== 5 then B=Tri A=Con end   if K== 6 then B=Tri A=Val end   if K== 7 then B=Tri A=Her end
        if K== 8 then B=Con A=Tri end   if K== 9 then B=Con A=Val end   if K==10 then B=Con A=Her end
        if K==11 then B=Val A=Tri end   if K==12 then B=Val A=Con end   if K==13 then B=Val A=Her end
        if K==14 then B=Her A=Tri end   if K==15 then B=Her A=Con end   if K==16 then B=Her A=Val end
        -->>if K==17 then B=Esc A=Tri end   if K==18 then B=Esc A=Con end   if K==19 then B=Esc A=Val end
        -->>if K==20 then B=Tri A=Esc end   if K==21 then B=Con A=Esc end   if K==22 then B=Val A=Esc end   
        -->>if K==23 then B=Her A=Esc end   if K==24 then B=Esc A=Her end    

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

    if intid == 1 then -- Triunfo por:
        -->>P:GossipMenuAddItem(4, "Por mis Emblemas de escarcha.", 20, 20, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de conquista.", 5, 5, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de valor.", 6, 6, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de heroísmo.", 7, 7, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end

    if intid == 2 then -- Conquista por:
        -->>P:GossipMenuAddItem(4, "Por mis Emblemas de escarcha.", 21, 21, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de triunfo.", 8, 8, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de valor.", 9, 9, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de heroísmo.", 10, 10, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end

    if intid == 3 then -- Valor por:
        -->>P:GossipMenuAddItem(4, "Por mis Emblemas de escarcha.", 22, 22, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de triunfo.", 11, 11, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de conquista.", 12, 12, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de heroísmo.", 13, 13, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end

    if intid == 4 then -- Heroísmo por:
        -->>P:GossipMenuAddItem(4, "Por mis Emblemas de escarcha.", 23, 23, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de triunfo.", 14, 14, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de conquista.", 15, 15, true, "Escribe la cantidad")
        P:GossipMenuAddItem(4, "Por mis Emblemas de valor.", 16, 16, true, "Escribe la cantidad")
        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
        P:GossipSendMenu(1, U, MenuId)
    end

-->>    if intid == 20 then -- Escarcha por:
-->>       P:GossipMenuAddItem(4, "Por mis Emblemas de triunfo.", 17, 17, true, "Escribe la cantidad")
-->>       P:GossipMenuAddItem(4, "Por mis Emblemas de conquista.", 18, 18, true, "Escribe la cantidad")
-->>       P:GossipMenuAddItem(4, "Por mis Emblemas de valor.", 19, 19, true, "Escribe la cantidad")
-->>       P:GossipMenuAddItem(4, "Por mis Emblemas de heroísmo.", 24, 24, true, "Escribe la cantidad")
-->>        P:GossipMenuAddItem(7, "< Atrás", 0, 0)
-->>        P:GossipSendMenu(1, U, MenuId)
-->>    end
-----------------------------------------------------------------------------------------------------------------------------------------------------
    if sender == 0 then OnGossipHello(E, P, U) end    
    if sender >= 5 and sender ~= 100 then Do(sender,tonumber(code),P,U,E) end    
-----------------------------------------------------------------------------------------------------------------------------------------------------
end
RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)