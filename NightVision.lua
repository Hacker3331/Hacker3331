firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Night Vision Goggles activated..")
local unuseditems = Instance.new("Folder")
unuseditems.Parent = workspace
unuseditems.Name = "Unused"

local cam = game.Workspace.CurrentCamera
local plr = game.Players.LocalPlayer
local root = plr.Character:WaitForChild("HumanoidRootPart")
local uis = game:GetService("UserInputService")
local debounce = false
local activate = Instance.new("Sound", root)
local effect = Instance.new("ColorCorrectionEffect", game.Lighting)
local light = Instance.new("PointLight", root)
light.Enabled=false
light.Range=1000
light.Brightness=.2
effect.Brightness=.5
effect.TintColor=Color3.fromRGB(0, 183, 0)
effect.Enabled=false
effect.Name = "nv"
activate.SoundId="http://roblox.com/asset/?id=131690369"
activate.MaxDistance=150
uis.InputBegan:Connect(function(began)
	if began.KeyCode == Enum.KeyCode.T then
		if not debounce then
			debounce = true
			game.Lighting.nv.Enabled=not game.Lighting.ColorCorrection.Enabled
			light.Enabled=not light.Enabled
			activate:Play()
			wait(0.01)
			debounce = false
		end
	end
end)
