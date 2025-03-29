-- Minimalist Dark UI - NebulaHub Notification (Centered)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- Clipboard copy function (requires executor with `setclipboard`)
local function copyLink()
    if setclipboard then
        setclipboard("https://discord.gg/nebulascripts")
        StarterGui:SetCore("SendNotification", {
            Title = "Copied!",
            Text = "Discord link copied to clipboard.",
            Duration = 3,
        })
    end
end

-- Main screen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NebulaHubNotificationUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Container frame (centered)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 160)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 8)
frameCorner.Parent = frame

-- Message text
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -20, 0, 100)
label.Position = UDim2.new(0, 10, 0, 10)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextWrapped = true
label.TextXAlignment = Enum.TextXAlignment.Left
label.TextYAlignment = Enum.TextYAlignment.Top
label.Font = Enum.Font.GothamSemibold
label.TextSize = 16
label.Text = "🛸 This script has now migrated to **NebulaHub**.\nIf you're interested in using it, join the link below or click the button to copy it."
label.Parent = frame

-- Copy button
local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 180, 0, 35)
copyButton.Position = UDim2.new(0.5, -90, 1, -45)
copyButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 14
copyButton.Text = "📎 Copy Discord Link"
copyButton.BorderSizePixel = 0
copyButton.AutoButtonColor = true
copyButton.Parent = frame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 6)
copyCorner.Parent = copyButton

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 24, 0, 24)
closeButton.Position = UDim2.new(1, -30, 0, 6)
closeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Text = "X"
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

-- Events
copyButton.MouseButton1Click:Connect(copyLink)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
