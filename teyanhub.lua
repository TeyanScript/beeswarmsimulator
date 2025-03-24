local TeyanHub = Instance.new("ScreenGui")
TeyanHub.Name = "TeyanHub"
TeyanHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TeyanHub.ResetOnSpawn = false

local Blur = Instance.new("BlurEffect")
Blur.Size = 20
Blur.Parent = game.Lighting

local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 350, 0, 250)
LoadingFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoadingFrame.BackgroundTransparency = 0.2
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = TeyanHub
Instance.new("UICorner", LoadingFrame).CornerRadius = UDim.new(0, 15)

local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, 0, 0.5, 0)
LoadingText.Position = UDim2.new(0, 0, 0.2, 0)
LoadingText.Text = "Teyan HUB"
LoadingText.TextColor3 = Color3.fromRGB(0, 255, 200)
LoadingText.BackgroundTransparency = 1
LoadingText.Font = Enum.Font.GothamBold
LoadingText.TextSize = 40
LoadingText.Parent = LoadingFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.7, 0, 0.15, 0)
KeyInput.Position = UDim2.new(0.15, 0, 0.7, 0)
KeyInput.Text = "Enter Key Here"
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.BackgroundTransparency = 0.3
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 20
KeyInput.Parent = LoadingFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 10)

local CorrectKey = "TeyanHub2025"
local MainFrame = nil
local clickCount = 0
local dragging, dragInput, dragStart, startPos

local function createMainUI()
    LoadingFrame:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
    wait(0.5)
    LoadingFrame.Visible = false
    
    MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 600, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = TeyanHub
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
    }
    Gradient.Rotation = 45
    Gradient.Parent = MainFrame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0.12, 0)
    Title.Text = "Teyan HUB"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 45
    Title.Parent = MainFrame
    
    local Minimize = Instance.new("TextButton")
    Minimize.Size = UDim2.new(0.08, 0, 0.08, 0)
    Minimize.Position = UDim2.new(0.9, 0, 0.02, 0)
    Minimize.Text = "-"
    Minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.Font = Enum.Font.GothamBold
    Minimize.TextSize = 25
    Minimize.Parent = MainFrame
    Instance.new("UICorner", Minimize).CornerRadius = UDim.new(0, 8)
    
    local Places = {"Blox Fruit", "Ro Ghoul", "Bee Swarm Simulator", "Shindo Life"}
    local posY = 0.2
    
    for i, place in pairs(Places) do
        local PlaceButton = Instance.new("TextButton")
        PlaceButton.Size = UDim2.new(0.22, 0, 0.15, 0)
        PlaceButton.Position = UDim2.new(0.05 + ((i-1) * 0.25), 0, posY, 0)
        PlaceButton.Text = place
        PlaceButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        PlaceButton.BackgroundTransparency = 0.3
        PlaceButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        PlaceButton.Font = Enum.Font.GothamBold
        PlaceButton.TextSize = 20
        PlaceButton.Parent = MainFrame
        Instance.new("UICorner", PlaceButton).CornerRadius = UDim.new(0, 12)
        
        PlaceButton.MouseButton1Click:Connect(function()
            local ScriptMenu = Instance.new("Frame")
            ScriptMenu.Size = UDim2.new(0.35, 0, 0.6, 0)
            ScriptMenu.Position = UDim2.new(0.325, 0, 0.25, 0)
            ScriptMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            ScriptMenu.BackgroundTransparency = 0.2
            ScriptMenu.Parent = MainFrame
            Instance.new("UICorner", ScriptMenu).CornerRadius = UDim.new(0, 15)
            
            local CloseMenu = Instance.new("TextButton")
            CloseMenu.Size = UDim2.new(0.15, 0, 0.1, 0)
            CloseMenu.Position = UDim2.new(0.85, 0, 0, 0)
            CloseMenu.Text = "X"
            CloseMenu.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            CloseMenu.TextColor3 = Color3.fromRGB(255, 255, 255)
            CloseMenu.Parent = ScriptMenu
            Instance.new("UICorner", CloseMenu).CornerRadius = UDim.new(0, 8)
            
            if place == "Ro Ghoul" then
                local AuthorLabel = Instance.new("TextLabel")
                AuthorLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
                AuthorLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
                AuthorLabel.Text = "PorryDepTrai"
                AuthorLabel.TextColor3 = Color3.fromRGB(0, 255, 200)
                AuthorLabel.BackgroundTransparency = 1
                AuthorLabel.Font = Enum.Font.GothamBold
                AuthorLabel.TextSize = 25
                AuthorLabel.Parent = ScriptMenu
                
                local InjectButton = Instance.new("TextButton")
                InjectButton.Size = UDim2.new(0.8, 0, 0.15, 0)
                InjectButton.Position = UDim2.new(0.1, 0, 0.4, 0)
                InjectButton.Text = "Inject"
                InjectButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                InjectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                InjectButton.Font = Enum.Font.GothamBold
                InjectButton.TextSize = 20
                InjectButton.Parent = ScriptMenu
                Instance.new("UICorner", InjectButton).CornerRadius = UDim.new(0, 10)
                
                InjectButton.MouseButton1Click:Connect(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/PorryDepTrai/exploit/main/DashBoostSolora.lua"))()
                    InjectButton.Text = "Injected!"
                    wait(1)
                    InjectButton.Text = "Inject"
                end)
            end
            
            CloseMenu.MouseButton1Click:Connect(function()
                ScriptMenu:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.3, true)
                wait(0.3)
                ScriptMenu:Destroy()
            end)
        end)
        
        PlaceButton.MouseEnter:Connect(function()
            PlaceButton:TweenSize(UDim2.new(0.24, 0, 0.17, 0), "Out", "Quad", 0.2, true)
        end)
        PlaceButton.MouseLeave:Connect(function()
            PlaceButton:TweenSize(UDim2.new(0.22, 0, 0.15, 0), "Out", "Quad", 0.2, true)
        end)
    end
    
    Title.MouseButton1Click:Connect(function()
        clickCount = clickCount + 1
        if clickCount >= 3 then
            MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
            wait(0.5)
            TeyanHub:Destroy()
            Blur:Destroy()
        end
    end)
    
    local minimized = false
    Minimize.MouseButton1Click:Connect(function()
        if not minimized then
            MainFrame:TweenSize(UDim2.new(0, 60, 0, 60), "Out", "Quad", 0.3, true)
            MainFrame:TweenPosition(UDim2.new(0.9, 0, 0.9, 0), "Out", "Quad", 0.3, true)
            for _, child in pairs(MainFrame:GetChildren()) do
                child.Visible = false
            end
            Minimize.Text = "TH"
            Minimize.Visible = true
            minimized = true
        else
            MainFrame:TweenSize(UDim2.new(0, 600, 0, 450), "Out", "Quad", 0.3, true)
            MainFrame:TweenPosition(UDim2.new(0.5, -300, 0.5, -225), "Out", "Quad", 0.3, true)
            for _, child in pairs(MainFrame:GetChildren()) do
                child.Visible = true
            end
            Minimize.Text = "-"
            minimized = false
        end
    end)
    
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    Title.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    Title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed and KeyInput.Text == CorrectKey then
        createMainUI()
    else
        KeyInput.TextColor3 = Color3.fromRGB(255, 50, 50)
        KeyInput.Text = "Invalid Key!"
        wait(1)
        KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeyInput.Text = "Enter Key Here"
    end
end)

spawn(function()
    for i = 0, 1, 0.1 do
        LoadingFrame.BackgroundTransparency = 1 - i
        LoadingText.TextTransparency = 1 - i
        KeyInput.TextTransparency = 1 - i
        wait(0.05)
    end
end)
