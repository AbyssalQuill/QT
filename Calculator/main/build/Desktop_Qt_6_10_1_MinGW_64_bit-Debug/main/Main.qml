import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: calculatorWindow
    visible: true
    width: 320
    height: 480
    title: qsTr("简易计算器")
    color: '#ffffff'
    minimumWidth: 280
    minimumHeight: 420
    maximumWidth: 320
    maximumHeight: 480

    // 计算核心变量
    property string currentInput: ""  // 当前输入
    property real firstNumber: 0      // 第一个运算数
    property string operatorType: ""  // 运算符（+、-、*、/）
    property bool isOperatorClicked: false  // 是否已点击运算符

    // 主容器（网格布局）
    GridLayout {
        anchors.fill: parent
        anchors.margins: 15
        columns: 4  // 4列布局（匹配计算器按钮矩阵）
        rowSpacing: 12
        columnSpacing: 12

        // 显示屏幕
        TextField {
            Layout.row: 0
            Layout.columnSpan: 4  // 跨4列
            Layout.preferredHeight: 60
            text: calculatorWindow.currentInput || "0"  // 默认显示0
            font.family: "微软雅黑"
            font.pointSize: 24
            horizontalAlignment: Text.AlignRight  // 右对齐（符合计算器习惯）
            verticalAlignment: Text.AlignVCenter
            background: Rectangle {
                color: '#ffffff'
                border.color: '#ffffff'
                border.width: 1
            }
            readOnly: true  // 禁止手动输入，仅通过按钮操作
        }

        // 功能按钮：清零（C）
        Button {
            id: clearButton
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 2  // 跨2列
            text: "C"
            font.pointSize: 18
            background: Rectangle {
                color: clearButton.pressed ? "#ff6b6b" : "#ff8787"
                radius: 8
            }
            onClicked: {
                calculatorWindow.currentInput = ""
                calculatorWindow.firstNumber = 0
                calculatorWindow.operatorType = ""
                calculatorWindow.isOperatorClicked = false
            }
        }

        // 功能按钮：除法（/）
        Button {
            id: divideButton
            Layout.row: 1
            Layout.column: 2
            text: "/"
            font.pointSize: 18
            background: Rectangle {
                color: divideButton.pressed ? "#4dabf7" : "#74c0fc"
                radius: 8
            
            }
            onClicked: {
                if (calculatorWindow.currentInput !== "") {
                    calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput)
                    calculatorWindow.operatorType = "/"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 功能按钮：乘法（*）
        Button {
            id: multiplyButton
            Layout.row: 1
            Layout.column: 3
            text: "x"
            font.pointSize: 18
            background: Rectangle {
                color: multiplyButton.pressed ? "#4dabf7" : "#74c0fc"
                radius: 8
            }
            onClicked: {
                if (calculatorWindow.currentInput !== "") {
                    calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput)
                    calculatorWindow.operatorType = "*"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 数字按钮：7
        Button {
            id: sevenButton
            Layout.row: 2
            Layout.column: 0
            text: "7"
            font.pointSize: 18
            background: Rectangle {
                color: sevenButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "7"
        }

        // 数字按钮：8
        Button {
            id: eightButton
            Layout.row: 2
            Layout.column: 1
            text: "8"
            font.pointSize: 18
            background: Rectangle {
                color: eightButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "8"
        }

        // 数字按钮：9
        Button {
            id: nineButton
            Layout.row: 2
            Layout.column: 2
            text: "9"
            font.pointSize: 18
            background: Rectangle {
                color: nineButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "9"
        }

        // 功能按钮：减法（-）
        Button {
            id: minusButton
            Layout.row: 2
            Layout.column: 3
            text: "-"
            font.pointSize: 18
            background: Rectangle {
                color: minusButton.pressed ? "#4dabf7" : "#74c0fc"
                radius: 8
            }
            onClicked: {
                if (calculatorWindow.currentInput !== "") {
                    calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput)
                    calculatorWindow.operatorType = "-"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 数字按钮：4
        Button {
            id: fourButton
            Layout.row: 3
            Layout.column: 0
            text: "4"
            font.pointSize: 18
            background: Rectangle {
                color: fourButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "4"
        }

        // 数字按钮：5
        Button {
            id: fiveButton
            Layout.row: 3
            Layout.column: 1
            text: "5"
            font.pointSize: 18
            background: Rectangle {
                color: fiveButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "5"
        }

        // 数字按钮：6
        Button {
            id: sixButton
            Layout.row: 3
            Layout.column: 2
            text: "6"
            font.pointSize: 18
            background: Rectangle {
                color: sixButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "6"
        }

        // 功能按钮：加法（+）
        Button {
            id: plusButton
            Layout.row: 3
            Layout.column: 3
            text: "+"
            font.pointSize: 18
            background: Rectangle {
                color: plusButton.pressed ? "#4dabf7" : "#74c0fc"
                radius: 8
            }
            onClicked: {
                if (calculatorWindow.currentInput !== "") {
                    calculatorWindow.firstNumber = parseFloat(calculatorWindow.currentInput)
                    calculatorWindow.operatorType = "+"
                    calculatorWindow.isOperatorClicked = true
                    calculatorWindow.currentInput = ""
                }
            }
        }

        // 数字按钮：1
        Button {
            id: oneButton
            Layout.row: 4
            Layout.column: 0
            text: "1"
            font.pointSize: 18
            background: Rectangle {
                color: oneButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "1"
        }

        // 数字按钮：2
        Button {
            id: twoButton
            Layout.row: 4
            Layout.column: 1
            text: "2"
            font.pointSize: 18
            background: Rectangle {
                color: twoButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "2"
        }

        // 数字按钮：3
        Button {
            id: threeButton
            Layout.row: 4
            Layout.column: 2
            text: "3"
            font.pointSize: 18
            background: Rectangle {
                color: threeButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "3"
        }

        // 功能按钮：等于（=）
        Button {
            id: equalsButton
            Layout.row: 4
            Layout.column: 3
            Layout.rowSpan: 2
            text: "="
            font.pointSize: 18
            background: Rectangle {
                color: equalsButton.pressed ? "#3bc9db" : "#6cd4e0"
                radius: 8
            }
            onClicked: {
                if (calculatorWindow.currentInput !== "" && calculatorWindow.operatorType !== "") {
                    var secondNumber = parseFloat(calculatorWindow.currentInput)
                    var result = 0
                    switch (calculatorWindow.operatorType) {
                        case "+":
                            result = calculatorWindow.firstNumber + secondNumber
                            break
                        case "-":
                            result = calculatorWindow.firstNumber - secondNumber
                            break
                        case "*":
                            result = calculatorWindow.firstNumber * secondNumber
                            break
                        case "/":
                            result = calculatorWindow.firstNumber / secondNumber
                            break
                    }
                    calculatorWindow.currentInput = String(result)
                    calculatorWindow.operatorType = ""
                    calculatorWindow.firstNumber = result
                    calculatorWindow.isOperatorClicked = false
                }
            }
        }

        // 数字按钮：0
        Button {
            id: zeroButton
            Layout.row: 5
            Layout.column: 0
            Layout.columnSpan: 2
            text: "0"
            font.pointSize: 18
            background: Rectangle {
                color: zeroButton.pressed ? '#ffffff' : '#ffffff'
                radius: 8
            }
            onClicked: calculatorWindow.currentInput += "0"
        }

        // 数字按钮：小数点
        Button {
            id: decimalButton
            Layout.row: 5
            Layout.column: 2
            text: "."
            font.pointSize: 18
            background: Rectangle {
                color: decimalButton.pressed ? "#e9ecef" : "#f8f9fa"

            }
            onClicked: {
                if (calculatorWindow.currentInput.indexOf(".") === -1) {
                    calculatorWindow.currentInput += "."
                }
            }
        }
    }
}