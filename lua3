-- 로컬스크립트에서 GUI 요소 설정
local player = game.Players.LocalPlayer
local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")

-- 텍스트 버튼 생성
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 200, 0, 50)  -- 크기 설정 (너비 200, 높이 50)
flyButton.Position = UDim2.new(0.5, -100, 0.5, -25)  -- 화면 중앙에 배치
flyButton.Text = "이준서의 스크립트"  -- 버튼 텍스트 설정
flyButton.Parent = screenGui  -- 버튼을 ScreenGui에 추가

-- 버튼 스타일 설정 (선택 사항)
flyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- 배경 색상 (검정)
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- 텍스트 색상 (흰색)
flyButton.Font = Enum.Font.SourceSansBold  -- 텍스트 폰트 설정
flyButton.TextSize = 24  -- 텍스트 크기 설정
flyButton.ZIndex = 10  -- 버튼이 다른 UI 요소 위에 오도록 설정

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

    -- 비행을 멈추는 기능
    local function disableFly()
        bodyVelocity:Destroy()
        isFlying = false
    end

    -- 버튼 클릭 시 비행 상태 토글
    flyButton.MouseButton1Click:Connect(function()
        if isFlying then
            disableFly()
        else
            enableFly()
        end
    end)
end

-- 텍스트 버튼을 클릭 시 플라이 활성화
flyButton.MouseButton1Click:Connect(function()
    if not isFlying then
        enableFly()
    else
        disableFly()
    end
end)
