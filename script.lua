-- BTT's Fake Chat Hax

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ChatHaxGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0, 50, 0, 100)
Frame.Size = UDim2.new(0, 300, 0, 180)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Visible = true

local Title = Instance.new("TextLabel", Frame)
Title.Text = "BTT's Chat Hax"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

local TargetBox = Instance.new("TextBox", Frame)
TargetBox.PlaceholderText = "Nom du joueur cible ou @everyone"
TargetBox.Size = UDim2.new(1, -20, 0, 30)
TargetBox.Position = UDim2.new(0, 10, 0, 40)
TargetBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.ClearTextOnFocus = false

local MessageBox = Instance.new("TextBox", Frame)
MessageBox.PlaceholderText = "Message à faire dire"
MessageBox.Size = UDim2.new(1, -20, 0, 30)
MessageBox.Position = UDim2.new(0, 10, 0, 80)
MessageBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MessageBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageBox.ClearTextOnFocus = false

local SendButton = Instance.new("TextButton", Frame)
SendButton.Text = "Envoyer"
SendButton.Size = UDim2.new(1, -20, 0, 30)
SendButton.Position = UDim2.new(0, 10, 0, 130)
SendButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.Font = Enum.Font.Gotham
SendButton.TextSize = 16

local function FakeSay(playerName, message)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = playerName .. ": " .. message,
        Color = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSans,
        TextSize = 18
    })
end

local function SendToAllPlayers(message)
    for _, player in pairs(Players:GetPlayers()) do
        FakeSay(player.Name, message)
    end
end

-- Fonction d'envoi
SendButton.MouseButton1Click:Connect(function()
    local name = TargetBox.Text
    local msg = MessageBox.Text

    if name ~= "" and msg ~= "" then
        if name:lower() == "@everyone" then
            SendToAllPlayers(msg)
        else
            local found = nil
            for _, p in pairs(Players:GetPlayers()) do
                if p.Name:lower():sub(1, #name) == name:lower() then
                    found = p
                    break
                end
            end

            if found then
                FakeSay(found.Name, msg)
            else
                FakeSay("SYSTEM", "Joueur '" .. name .. "' introuvable.")
            end
        end
    end
end)
