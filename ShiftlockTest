local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ShiftLockGui = Instance.new("ScreenGui")
ShiftLockGui.Name = "shiftlockk"
ShiftLockGui.ResetOnSpawn = false
ShiftLockGui.Parent = PlayerGui

local LockButton = Instance.new("ImageButton")
LockButton.Name = "LockButton"
LockButton.Parent = ShiftLockGui
LockButton.AnchorPoint = Vector2.new(0.5, 0.5)
LockButton.Position = UDim2.new(0.85, 0, 0.5, 0)
LockButton.Size = UDim2.new(0, 70, 0, 70)
LockButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LockButton.BackgroundTransparency = 0.2
LockButton.BorderSizePixel = 0
LockButton.Image = ""

local ButtonIcon = Instance.new("ImageLabel")
ButtonIcon.Name = "btnIcon"
ButtonIcon.Parent = LockButton
ButtonIcon.BackgroundTransparency = 1
ButtonIcon.Position = UDim2.new(0.15, 0, 0.15, 0)
ButtonIcon.Size = UDim2.new(0.7, 0, 0.7, 0)
ButtonIcon.Image = "rbxasset://textures/ui/mouseLock_off.png"
ButtonIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", LockButton).CornerRadius = UDim.new(1, 0)

local ButtonStroke = Instance.new("UIStroke", LockButton)
ButtonStroke.Color = Color3.fromRGB(255, 255, 255)
ButtonStroke.Thickness = 2

local Crosshair = Instance.new("ImageLabel")
Crosshair.Name = "ShiftLockCrosshair"
Crosshair.Parent = ShiftLockGui
Crosshair.AnchorPoint = Vector2.new(0.5, 1)
Crosshair.Position = UDim2.new(0.5, 0, 0.5, 0)
Crosshair.Size = UDim2.new(0, 34, 0, 34)
Crosshair.BackgroundTransparency = 1
Crosshair.Image = "rbxassetid://10181263678"
Crosshair.Visible = false

local isShiftLockEnabled = false
local userGameSettings = nil
local OFFSET_VAL = 1.75 

local function enforceOfficialSync()
    if not isShiftLockEnabled then 
        RunService:UnbindFromRenderStep("FinalNailSync")
        return 
    end

    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local cam = workspace.CurrentCamera
    if not hum then return end

    if not userGameSettings then
        pcall(function() userGameSettings = UserSettings():GetService("UserGameSettings") end)
    end
    if userGameSettings then
        if userGameSettings.RotationType ~= Enum.RotationType.CameraRelative then
            pcall(function() userGameSettings.RotationType = Enum.RotationType.CameraRelative end)
        end
    end

    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter

    local dist = (cam.Focus.Position - cam.CFrame.Position).Magnitude
    if dist > 0.6 then
        local rawCFrame = cam.CFrame
        cam.CFrame = rawCFrame * CFrame.new(OFFSET_VAL, 0, 0)
        cam.Focus = cam.CFrame * CFrame.new(0, 0, -dist)
        hum.CameraOffset = Vector3.new(0, 0, 0)
    else
        hum.CameraOffset = Vector3.new(0, 0, 0)
    end
end

local function ToggleShiftLock(enabled)
    isShiftLockEnabled = enabled
    Crosshair.Visible = enabled
    
    RunService:UnbindFromRenderStep("FinalNailSync")

    if enabled then
        ButtonIcon.ImageColor3 = Color3.fromRGB(0, 255, 150)
        ButtonStroke.Color = Color3.fromRGB(0, 255, 150)
        RunService:BindToRenderStep("FinalNailSync", Enum.RenderPriority.Camera.Value + 1, enforceOfficialSync)
    else
        ButtonIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        ButtonStroke.Color = Color3.fromRGB(255, 255, 255)
        
        if userGameSettings then
            pcall(function() userGameSettings.RotationType = Enum.RotationType.MovementRelative end)
        end
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.CameraOffset = Vector3.new(0, 0, 0) end
    end
end


LockButton.MouseButton1Click:Connect(function()
    ToggleShiftLock(not isShiftLockEnabled)
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    RunService:UnbindFromRenderStep("FinalNailSync")
    
    if isShiftLockEnabled then
        local hum = char:WaitForChild("Humanoid")
        hum.CameraOffset = Vector3.new(0, 0, 0)
        task.wait(0.1)
        RunService:BindToRenderStep("FinalNailSync", Enum.RenderPriority.Camera.Value + 1, enforceOfficialSync)
    end
end)

local dragging, dragStart, startPos
LockButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true dragStart = input.Position startPos = LockButton.Position
    end
end)
LockButton.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        LockButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
