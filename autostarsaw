local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleAutoStarSaw"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 40, 60)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

local Dragging = false
local DragStart = nil
local StartPos = nil

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(
            StartPos.X.Scale,
            StartPos.X.Offset + Delta.X,
            StartPos.Y.Scale,
            StartPos.Y.Offset + Delta.Y
        )
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = false
    end
end)

local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, 0, 0, 30)
TabFrame.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
TabFrame.BorderSizePixel = 0
TabFrame.Parent = MainFrame

local MainTabButton = Instance.new("TextButton")
MainTabButton.Size = UDim2.new(0.4, 0, 1, 0)
MainTabButton.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
MainTabButton.Text = "MAIN"
MainTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
MainTabButton.Font = Enum.Font.SourceSansBold
MainTabButton.TextSize = 14
MainTabButton.Parent = TabFrame

local InfoTabButton = Instance.new("TextButton")
InfoTabButton.Size = UDim2.new(0.4, 0, 1, 0)
InfoTabButton.Position = UDim2.new(0.4, 0, 0, 0)
InfoTabButton.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
InfoTabButton.Text = "INFO"
InfoTabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoTabButton.Font = Enum.Font.SourceSansBold
InfoTabButton.TextSize = 14
InfoTabButton.Parent = TabFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0.2, 0, 1, 0)
CloseButton.Position = UDim2.new(0.8, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
CloseButton.Text = "CLOSE"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 14
CloseButton.Parent = TabFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local MainTab = Instance.new("Frame")
MainTab.Size = UDim2.new(1, 0, 1, -30)
MainTab.Position = UDim2.new(0, 0, 0, 30)
MainTab.BackgroundTransparency = 1
MainTab.Parent = MainFrame

local InfoTab = Instance.new("Frame")
InfoTab.Size = UDim2.new(1, 0, 1, -30)
InfoTab.Position = UDim2.new(0, 0, 0, 30)
InfoTab.BackgroundTransparency = 1
InfoTab.Visible = false
InfoTab.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 120, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -60, 0, 40)
ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 70, 90)
ToggleButton.Text = "OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 100, 100)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 16
ToggleButton.Parent = MainTab

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

local InfoText = Instance.new("TextLabel")
InfoText.Size = UDim2.new(1, 0, 1, 0)
InfoText.BackgroundTransparency = 1
InfoText.Text = "By Teyan\n24.03.2025 last update\n0.1 version\ncontact\ndiscord: korikose"
InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoText.Font = Enum.Font.SourceSans
InfoText.TextSize = 14
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.Parent = InfoTab

MainTabButton.MouseButton1Click:Connect(function()
    MainTab.Visible = true
    InfoTab.Visible = false
    MainTabButton.BackgroundColor3 = Color3.fromRGB(90, 80, 100)
    InfoTabButton.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
    CloseButton.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
end)

InfoTabButton.MouseButton1Click:Connect(function()
    MainTab.Visible = false
    InfoTab.Visible = true
    MainTabButton.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
    InfoTabButton.BackgroundColor3 = Color3.fromRGB(90, 80, 100)
    CloseButton.BackgroundColor3 = Color3.fromRGB(70, 60, 80)
end)

local IsActive = false

ToggleButton.MouseButton1Click:Connect(function()
    IsActive = not IsActive
    if IsActive then
        ToggleButton.Text = "TRUE"
        ToggleButton.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        ToggleButton.Text = "OFF"
        ToggleButton.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

local function PressKey()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Three, false, game)
    wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Three, false, game)
end

spawn(function()
    while true do
        if IsActive then
            for i = 1, 3 do
                PressKey()
                task.wait(3)
            end
            task.wait(20)
        else
            task.wait(1)
        end
    end
end)
