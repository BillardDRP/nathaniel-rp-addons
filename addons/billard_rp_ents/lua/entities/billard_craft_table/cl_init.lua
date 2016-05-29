include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

local function RunWindow()
	local frame = vgui.Create("DFrame")
	frame:SetPos( 0.4359375 * ScrW(), 0.18796296296296 * ScrH() )
	frame:SetSize( 0.11145833333333 * ScrW(), 0.31574074074074 * ScrH() )
	frame:MakePopup() 

	local BuyLabel = vgui.Create( "DLabel", frame )
	BuyLabel:SetPos( 0.037383177570093 * frame:GetWide(), 0.093841642228739 * frame:GetTall() )
	BuyLabel:SetSize( 0.93457943925234 * frame:GetWide(), 0.058651026392962 * frame:GetTall() )
						 
	local WoodButton = vgui.Create( "DButton", frame )
	WoodButton:SetPos( 0.037383177570093 * frame:GetWide(), 0.17008797653959 * frame:GetTall() )
	WoodButton:SetSize( 0.93457943925234 * frame:GetWide(), 0.064516129032258 * frame:GetTall() )
				
	local SpringButton = vgui.Create( "DButton", frame )
	SpringButton:SetPos( 0.037383177570093 * frame:GetWide(), 0.25219941348974 * frame:GetTall() )
	SpringButton:SetSize( 0.93457943925234 * frame:GetWide(), 0.064516129032258 * frame:GetTall() )

	local WrenchButton = vgui.Create( "DButton", frame )
	WrenchButton:SetPos( 0.032710280373832 * frame:GetWide(), 0.34017595307918 * frame:GetTall() )
	WrenchButton:SetSize( 0.93457943925234 * frame:GetWide(), 0.064516129032258 * frame:GetTall() )

	local GunpowderButton = vgui.Create( "DButton", frame )
	GunpowderButton:SetPos( 0.037383177570093 * frame:GetWide(), 0.42521994134897 * frame:GetTall() )
	GunpowderButton:SetSize( 0.93457943925234 * frame:GetWide(), 0.064516129032258 * frame:GetTall() )

	local CraftProgress = vgui.Create( "DProgress", frame )
	CraftProgress:SetPos( 0.032710280373832 * frame:GetWide(), 0.90615835777126 * frame:GetTall() )
	CraftProgress:SetSize( 0.9392523364486 * frame:GetWide(), 0.070381231671554 * frame:GetTall() )

	local ProgressLabel = vgui.Create( "DLabel", frame )
	ProgressLabel:SetPos( 0.037383177570093 * frame:GetWide(), 0.82991202346041 * frame:GetTall() )
	ProgressLabel:SetSize( 0.93457943925234 * frame:GetWide(), 0.058651026392962 * frame:GetTall() )
	
	local ItemChoose = vgui.Create( "DComboBox", frame )
	ItemChoose:SetPos( 0.037383177570093 * frame:GetWide(), 0.66568914956012 * frame:GetTall() )
	ItemChoose:SetSize( 0.93457943925234 * frame:GetWide(), 0.064516129032258 * frame:GetTall() )

	local ChooseLabel = vgui.Create( "DLabel", frame )
	ChooseLabel:SetPos( 0.032710280373832 * frame:GetWide(), 0.58064516129032 * frame:GetTall() )
	ChooseLabel:SetSize( 0.93457943925234 * frame:GetWide(), 0.058651026392962 * frame:GetTall()
	
end

usermessage.Hook("BillardCraftTableOpenMenu", function()
	RunWindow()
end)
