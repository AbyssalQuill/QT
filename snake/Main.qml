import QtQuick 2.15
import QtQuick.Window 2.15

pragma ComponentBehavior: Bound

Window {
    id: window
    width: 400
    height: 500
    visible: true
    title: "贪吃蛇游戏"
    color: "#222"
    minimumWidth: 400
    minimumHeight: 500
    maximumWidth: 400
    maximumHeight: 500
    flags: Qt.Window | Qt.MSWindowsFixedSizeDialogHint

    // 游戏参数
    property int gridSize: 20
    // 移除硬编码的gameAreaWidth和gameAreaHeight，让游戏区域自适应
    property int headerHeight: 80
    property int cellCountX: gameArea.width / gridSize
    property int cellCountY: gameArea.height / gridSize
    property int dir: 1 // 移动方向（1=右，2=下，3=左，4=上）
    property bool gameOver: false
    property bool gameStarted: false
    property int score: 0
    property int highScore: 0
    property int gameSpeed: 200 // 毫秒
    property bool gamePaused: false

    // 游戏循环定时器
    Timer {
        id: gameTimer
        interval: window.gameSpeed
        running: window.gameStarted && !window.gameOver && !window.gamePaused
        repeat: true
        onTriggered: {
            window.moveSnake()
        }
    }

    // 创建一个焦点项来处理键盘事件
    FocusScope {
        id: focusScope
        anchors.fill: parent
        Keys.enabled: true
        Component.onCompleted: {
            focusScope.forceActiveFocus();
        }
        Keys.onPressed: (event) => {
            if (!window.gameStarted) {
                if (event.key === Qt.Key_Space) {
                    window.initGame();
                }
                return;
            }

            // 暂停/继续
            if (event.key === Qt.Key_P) {
                window.togglePause();
                return;
            }

            // 重启游戏
            if (event.key === Qt.Key_R && window.gameOver) {
                window.resetGame();
                return;
            }

            // 方向控制（防止反向移动）
            if (event.key === Qt.Key_Right && window.dir !== 3) {
                window.dir = 1;
            } else if (event.key === Qt.Key_Down && window.dir !== 4) {
                window.dir = 2;
            } else if (event.key === Qt.Key_Left && window.dir !== 1) {
                window.dir = 3;
            } else if (event.key === Qt.Key_Up && window.dir !== 2) {
                window.dir = 4;
            }
            
            // 防止事件继续传播
            event.accepted = true;
        }
    }

    // 蛇身数据
    ListModel { id: snakeModel }

    // 食物坐标
    property int foodX: 0
    property int foodY: 0

    // 障碍物坐标
    ListModel { id: obstacleModel }

    // 生成食物坐标
    function generateFood() {
        var newFoodX, newFoodY;
        var validPosition = false;

        while (!validPosition) {
            newFoodX = Math.floor(Math.random() * cellCountX) * gridSize;
            newFoodY = Math.floor(Math.random() * cellCountY) * gridSize;

            // 检查是否与蛇身重叠
            var onSnake = false;
            for (var i = 0; i < snakeModel.count; i++) {
                var segment = snakeModel.get(i);
                if (segment.x === newFoodX && segment.y === newFoodY) {
                    onSnake = true;
                    break;
                }
            }

            // 检查是否与障碍物重叠
            var onObstacle = false;
            for (var j = 0; j < obstacleModel.count; j++) {
                var obstacle = obstacleModel.get(j);
                if (obstacle.x === newFoodX && obstacle.y === newFoodY) {
                    onObstacle = true;
                    break;
                }
            }

            if (!onSnake && !onObstacle) {
                validPosition = true;
            }
        }

        foodX = newFoodX;
        foodY = newFoodY;
    }

    // 生成障碍物
    function generateObstacles() {
        obstacleModel.clear();
        
        // 生成一些随机障碍物
        var obstacleCount = 5;
        for (var i = 0; i < obstacleCount; i++) {
            var validPosition = false;
            var obsX, obsY;
            
            while (!validPosition) {
                obsX = Math.floor(Math.random() * cellCountX) * gridSize;
                obsY = Math.floor(Math.random() * cellCountY) * gridSize;
                
                // 检查是否与蛇身重叠
                var onSnake = false;
                for (var j = 0; j < snakeModel.count; j++) {
                    var segment = snakeModel.get(j);
                    if (segment.x === obsX && segment.y === obsY) {
                        onSnake = true;
                        break;
                    }
                }
                
                // 检查是否与已有障碍物重叠
                var duplicate = false;
                for (var k = 0; k < obstacleModel.count; k++) {
                    var obstacle = obstacleModel.get(k);
                    if (obstacle.x === obsX && obstacle.y === obsY) {
                        duplicate = true;
                        break;
                    }
                }
                
                if (!onSnake && !duplicate) {
                    validPosition = true;
                }
            }
            
            obstacleModel.append({x: obsX, y: obsY});
        }
    }

    // 初始化游戏
    function initGame() {
        snakeModel.clear();
        obstacleModel.clear();
        
        // 初始化蛇身（3个节点）
        snakeModel.append({x: 100, y: 100});
        snakeModel.append({x: 80, y: 100});
        snakeModel.append({x: 60, y: 100});
        
        dir = 1; // 初始方向向右
        gameOver = false;
        gameStarted = true;
        score = 0;
        gamePaused = false;
        
        generateFood();
        generateObstacles();
        
        focusScope.forceActiveFocus(); // 确保焦点项获取键盘焦点
    }

    // 重置游戏
    function resetGame() {
        initGame();
    }

    // 暂停/继续游戏
    function togglePause() {
        if (gameStarted && !gameOver) {
            gamePaused = !gamePaused;
        }
    }

    // 移动蛇
    function moveSnake() {
        if (gameOver || !gameStarted) return;

        // 计算新蛇头坐标
        var head = snakeModel.get(0);
        var newX = head.x;
        var newY = head.y;

        switch (dir) {
            case 1: newX += gridSize; break; // 右
            case 2: newY += gridSize; break; // 下
            case 3: newX -= gridSize; break; // 左
            case 4: newY -= gridSize; break; // 上
        }

        // 边界碰撞检测
        if (newX < 0 || newX >= gameArea.width || newY < 0 || newY >= gameArea.height) {
            gameOver = true;
            if (score > highScore) {
                highScore = score;
            }
            return;
        }

        // 自身碰撞检测
        for (var i = 0; i < snakeModel.count; i++) {
            var segment = snakeModel.get(i);
            if (segment.x === newX && segment.y === newY) {
                gameOver = true;
                if (score > highScore) {
                    highScore = score;
                }
                return;
            }
        }

        // 障碍物碰撞检测
        for (var j = 0; j < obstacleModel.count; j++) {
            var obstacle = obstacleModel.get(j);
            if (obstacle.x === newX && obstacle.y === newY) {
                gameOver = true;
                if (score > highScore) {
                    highScore = score;
                }
                return;
            }
        }

        // 添加新蛇头
        snakeModel.insert(0, {x: newX, y: newY});

        // 检查是否吃到食物
        if (newX === foodX && newY === foodY) {
            score += 10;
            // 难度随分数增加而提升（速度加快，最小间隔100ms）
            if (gameSpeed > 100) {
                gameSpeed = 200 - Math.min(Math.floor(score / 50) * 10, 100);
                gameTimer.interval = gameSpeed;
            }
            generateFood(); // 重新生成食物
        } else {
            // 没吃到食物则删除尾节点
            snakeModel.remove(snakeModel.count - 1);
        }
    }

    // 游戏区域
    Rectangle {
        id: gameArea
        width: parent.width - 20
        height: parent.height - header.height - 30
        color: "#333"
        anchors.top: header.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        anchors.bottomMargin: 10

        // 绘制网格线（可选）
        Repeater {
            model: window.cellCountX - 1
            Rectangle {
                required property int index
                x: (index + 1) * window.gridSize - 1
                y: 0
                width: 1
                height: parent.height
                color: "#444"
            }
        }

        Repeater {
            model: window.cellCountY - 1
            Rectangle {
                required property int index
                x: 0
                y: (index + 1) * window.gridSize - 1
                width: parent.width
                height: 1
                color: "#444"
            }
        }

        // 绘制蛇身
        Repeater {
            model: snakeModel
            delegate: Rectangle {
                required property var model
                x: model.x
                y: model.y
                width: window.gridSize
                height: window.gridSize
                color: model.index === 0 ? "#0af" : "#0f0" // 蛇头青色，蛇身绿色
                radius: 3
                border.color: "#222"
                border.width: 1
            }
        }

        // 绘制障碍物
        Repeater {
            model: obstacleModel
            delegate: Rectangle {
                required property var model
                x: model.x
                y: model.y
                width: window.gridSize
                height: window.gridSize
                color: "#aaa"
                radius: 3
            }
        }

        // 绘制食物
        Rectangle {
            x: window.foodX
            y: window.foodY
            width: window.gridSize
            height: window.gridSize
            color: "#f00"
            radius: window.gridSize / 2
            border.color: "#fff"
            border.width: 1

            // 食物动画
            NumberAnimation on rotation {
                from: 0
                to: 360
                duration: 2000
                loops: Animation.Infinite
            }
        }
    }

    // 游戏控制UI
    Rectangle {
        id: header
        width: parent.width
        height: window.headerHeight
        color: "#444"
        anchors.top: parent.top

        // 分数显示
        Column {
            anchors.centerIn: parent
            spacing: 5

            Text {
                id: scoreText
                text: "得分: " + window.score
                color: "#fff"
                font.pixelSize: 18
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: "最高分: " + window.highScore
                color: "#ff0"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: "速度: " + Math.round((200 - window.gameSpeed) / 10 + 1)
                color: "#0f0"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    // 游戏开始提示
    Text {
        id: startPrompt
        text: "按空格开始游戏"
        visible: !window.gameStarted
        color: "#0f0"
        font.pixelSize: 24
        font.bold: true
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
    }

    // 游戏暂停提示
    Text {
        id: pausePrompt
        text: "游戏已暂停\n按P继续"
        visible: window.gamePaused && window.gameStarted && !window.gameOver
        color: "#ff0"
        font.pixelSize: 24
        font.bold: true
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
    }

    // 游戏结束提示
    Text {
        id: gameOverPrompt
        text: "游戏结束!\n得分: " + window.score + "\n按R重新开始"
        visible: window.gameOver
        color: '#0497f9'
        font.pixelSize: 24
        font.bold: true
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
    }

    // 控制说明
    Text {
        text: "方向键: 移动 | P: 暂停 | R: 重启"
        color: "#aaa"
        font.pixelSize: 12
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 5
    }
}