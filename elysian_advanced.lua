-- ELYSIAN UI (Legit Game Version)
-- Created for SPCK Editor & Roblox Studio

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ELYSIAN_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 340)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "ELYSIAN HUB"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = Frame

-- Speed Button
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0.8, 0, 0, 40)
SpeedButton.Position = UDim2.new(0.1, 0, 0.2, 0)
SpeedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.Font = Enum.Font.Gotham
SpeedButton.TextSize = 18
SpeedButton.Text = "Toggle Speed"
SpeedButton.Parent = Frame

Instance.new("UICorner", SpeedButton).CornerRadius = UDim.new(0, 6)

local speedEnabled = false
SpeedButton.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    humanoid.WalkSpeed = speedEnabled and 50 or 16
    SpeedButton.Text = speedEnabled and "Speed ON" or "Speed OFF"
end)

-- Air Dash Button
local DashButton = Instance.new("TextButton")
DashButton.Size = UDim2.new(0.8, 0, 0, 40)
DashButton.Position = UDim2.new(0.1, 0, 0.35, 0)
DashButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DashButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DashButton.Font = Enum.Font.Gotham
DashButton.TextSize = 18
DashButton.Text = "Air Dash"
DashButton.Parent = Frame

Instance.new("UICorner", DashButton).CornerRadius = UDim.new(0, 6)

DashButton.MouseButton1Click:Connect(function()
    if character and rootPart then
        local dashVector = rootPart.CFrame.LookVector * 50
        rootPart.Velocity = Vector3.new(dashVector.X, 20, dashVector.Z)
    end
end)

-- Camera Shake Example (Keybind: F)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        local cam = workspace.CurrentCamera
        local shake = Instance.new("CameraShaker")
        shake:Start()
        shake:ShakeOnce(2, 10, 0.1, 0.5)
    end
end)

-- Make UI Draggable
Frame.Active = true
Frame.Draggable = true
