-- GUI 요소 찾기
local player = game.Players.LocalPlayer
local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
local flyButton = screenGui:WaitForChild("FlyButton")

-- 플라이 상태 변수
local isFlying = false
local humanoid = player.Character and player.Character:WaitForChild("Humanoid")

-- 플라이 함수
local function enableFly()
    if not humanoid or isFlying then return end
    isFlying = true

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
    bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- 위로 떠오르게 하는 힘
    bodyVelocity.Parent = player.Character:WaitForChild("HumanoidRootPart")

    -- 비행을 멈추는 기능 추가
    local function disableFly()
        bodyVelocity:Destroy()
        isFlying = false
    end

    -- 비행 상태에서 버튼 클릭 시 멈추게 하기
    flyButton.MouseButton1Click:Connect(function()
        if isFlying then
            disableFly()
        else
            enableFly()
        end
    end)
end

-- 버튼 클릭 시 플라이 활성화/비활성화
flyButton.MouseButton1Click:Connect(function()
    if not isFlying then
        enableFly()
    else
        disableFly()
    end
end)
