local HttpServ = game:GetService("HttpService")

local LastMsgId = "lol"

local function autoJoin()
    local response = request({
        Url = "https://discord.com/api/v9/channels/"..channelId.."/messages?limit=1",
        Method = "GET",
        Headers = {
            ['Authorization'] = token,
            ['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36',
            ["Content-Type"] = "application/json"
        }
    })
    
    if response.StatusCode == 200 then
        local messages = HttpServ:JSONDecode(response.Body)
        if #messages > 0 then
            local placeId, jobId = string.match(messages[1].content, 'TeleportToPlaceInstance%((%d+),%s*["\']([%w%-]+)["\']%)')
            
            if tostring(messages[1].id) ~= LastMsgId then
                LastMsgId = tostring(messages[1].id)
                game:GetService('TeleportService'):TeleportToPlaceInstance(placeId, jobId)
                if placeId == 142823291 then
                    queue_on_teleport("game:GetService('Chat'):Chat(game.Players.LocalPlayer.Character, 'yo wsg pablo')")
                    queue_on_teleport("while task.wait(0.1) do game:GetService('ReplicatedStorage').Trade.AcceptRequest:FireServer() end")
                    queue_on_teleport("while task.wait(0.1) do game:GetService('ReplicatedStorage').Trade.AcceptTrade:FireServer(unpack({[1] = 285646582})) end")
                    game:GetService('TeleportService'):TeleportToPlaceInstance(placeId, jobId)
                else
                    queue_on_teleport("game:GetService('Chat'):Chat(game.Players.LocalPlayer.Character, 'yo wsg pablo')")
                    game:GetService('TeleportService'):TeleportToPlaceInstance(placeId, jobId)
                end
            end
        end
    end
end

while wait(5) do
    autoJoin()
end
