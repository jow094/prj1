<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/custom.css" />
</head>
<body>

<div class="game">
    <c:forEach var="i" begin="0" end="99" varStatus="inum">
        <c:forEach var="j" begin="0" end="199" varStatus="jnum">
            <div class="box" id="${inum.index}_${jnum.index}"></div>
        </c:forEach>
    </c:forEach>
</div>
<script>
    $(document).ready(function () {
        const snake = [[0, 0]]; // 초기 지렁이 위치 (머리)
        const maxLength = 6; // 지렁이의 최대 길이
        let direction = null; // 현재 방향
        let canChangeDirection = true; // 방향 변경 가능 여부
        $('#0_0').addClass('user'); // 초기 위치에 user 클래스 추가
        
        const monsters = []; // 몬스터 배열
        const monsterCount = 150; // 몬스터 개수
        const coins = []; // 코인 배열
        const coinCount = 50; // 코인 개수

        // 게임 오버 메서드
        function gameOver() {
            alert('Game Over!'); // 게임 오버 시 알림
            clearInterval(gameInterval); // 게임 종료 시 인터벌 클리어
        }

        // 게임 클리어 메서드
        function gameClear() {
            alert('Game Clear!'); // 게임 클리어 시 알림
            clearInterval(gameInterval); // 게임 종료 시 인터벌 클리어
        }

        // 코인 초기화 및 추가
        function initializeCoins() {
            for (let i = 0; i < coinCount; i++) {
                let row, col;
                do {
                    row = Math.floor(Math.random() * 100);
                    col = Math.floor(Math.random() * 200);
                } while (isPositionOccupied(row, col)); // 다른 객체와 겹치지 않도록
                coins.push([row, col]);
                $('#' + row + '_' + col).addClass('coin'); // 초기 코인 위치에 클래스 추가
            }
        }

        // 위치가 겹치는지 확인하는 함수
        function isPositionOccupied(row, col) {
            // 유저 위치 확인
            if (snake.some(([r, c]) => r === row && c === col)) return true;
            // 몬스터 위치 확인
            if (monsters.some(monsterObj => 
                monsterObj.snake.some(([r, c]) => r === row && c === col)
            )) return true;
            // 코인 위치 확인
            if (coins.some(([r, c]) => r === row && c === col)) return true;
            return false;
        }

        // 코인을 수집하는 메서드
        function collectCoins() {
            coins.forEach((coin, index) => {
                const [row, col] = coin;
                // 유저의 머리 위치와 코인 위치가 같으면
                if (snake[0][0] === row && snake[0][1] === col) {
                    $('#' + row + '_' + col).removeClass('coin'); // 코인 삭제
                    coins.splice(index, 1); // 배열에서 코인 삭제
                    // 코인이 하나도 없으면 게임 클리어
                    if (coins.length === 0) {
                        gameClear();
                    }
                }
            });
        }

        // 몬스터 초기화
        function initializeMonsters() {
            for (let i = 0; i < monsterCount; i++) {
                const monsterSnake = [[Math.floor(Math.random() * 100), Math.floor(Math.random() * 200)]];
                const direction = getRandomDirection();
                monsters.push({ snake: monsterSnake, direction });
            }
        }

        // 랜덤 방향을 가져오는 함수
        function getRandomDirection() {
            const directions = ['right', 'left', 'up', 'down'];
            return directions[Math.floor(Math.random() * directions.length)];
        }

        // 몬스터 이동
        function moveMonsters() {
            monsters.forEach(monsterObj => {
                const { snake, direction } = monsterObj;
                const head = snake[0];
                const newRow = head[0];
                const newCol = head[1];

                // 기존 몬스터 클래스 제거
                snake.forEach(([row, col]) => {
                    $('#' + row + '_' + col).removeClass('monster');
                });

                // 새로운 머리 위치 계산
                let moveRow = newRow;
                let moveCol = newCol;

                if (direction === 'right' && moveCol < 199) {
                    moveCol++;
                } else if (direction === 'left' && moveCol > 0) {
                    moveCol--;
                } else if (direction === 'up' && moveRow > 0) {
                    moveRow--;
                } else if (direction === 'down' && moveRow < 99) {
                    moveRow++;
                }

                // 새로운 머리 위치를 배열의 맨 앞에 추가
                snake.unshift([moveRow, moveCol]);

                // 몬스터가 최대 길이를 초과하면 마지막 요소 제거
                if (snake.length > 15) {
                    snake.pop();
                }

                // 새로운 위치에 몬스터 클래스 추가
                snake.forEach(([row, col]) => {
                    $('#' + row + '_' + col).addClass('monster');
                });

                // 랜덤으로 방향을 바꾸는 로직 추가
                if (Math.random() < 0.8) { 
                    monsterObj.direction = getRandomDirection();
                }
            });
        }

        // 유저 이동 및 조작
        $(document).on('keydown', function (e) {
            e.preventDefault(); // 기본 이벤트 방지
            
            if (!canChangeDirection) return; // 방향 변경 불가 시 리턴
            canChangeDirection = false; // 방향 변경 불가로 설정
            
            // 기존 user 클래스 제거
            for (let i = 0; i < snake.length; i++) {
                const [row, col] = snake[i];
                $('#' + row + '_' + col).removeClass('user');
            }

            // 새로운 머리 위치 계산
            let newRow = snake[0][0];
            let newCol = snake[0][1];

            // 방향키에 따라 이동
            if (e.key === 'ArrowRight' && direction !== 'left' && newCol < 199) {
                newCol++;
                direction = 'right'; // 현재 방향 설정
            } else if (e.key === 'ArrowLeft' && direction !== 'right' && newCol > 0) {
                newCol--;
                direction = 'left';
            } else if (e.key === 'ArrowUp' && direction !== 'down' && newRow > 0) {
                newRow--;
                direction = 'up';
            } else if (e.key === 'ArrowDown' && direction !== 'up' && newRow < 99) {
                newRow++;
                direction = 'down';
            }

            // 새로운 머리 위치를 배열의 맨 앞에 추가
            snake.unshift([newRow, newCol]);

            // 지렁이가 최대 길이를 초과하면 마지막 요소 제거
            if (snake.length > maxLength) {
                snake.pop();
            }

            // 새로운 위치에 user 클래스 추가
            for (let i = 0; i < snake.length; i++) {
                const [row, col] = snake[i];
                $('#' + row + '_' + col).addClass('user');
            }

            collectCoins(); // 코인 수집 체크

            setTimeout(() => {
                canChangeDirection = true; // 방향 변경 가능으로 설정
            }, 50);
        });

        // 유저와 몬스터의 충돌 체크
        function checkCollision() {
            $('.box.user.monster').each(function() {
                gameOver(); // 충돌 발생 시 게임 오버
            });
        }

        // 1초마다 자동으로 이동
        const gameInterval = setInterval(() => {
            if (direction) { // 방향이 설정되어 있으면
                // 기존 user 클래스 제거
                for (let i = 0; i < snake.length; i++) {
                    const [row, col] = snake[i];
                    $('#' + row + '_' + col).removeClass('user');
                }

                // 새로운 머리 위치 계산
                let newRow = snake[0][0];
                let newCol = snake[0][1];

                // 방향에 따라 위치 변경
                if (direction === 'right' && newCol < 199) {
                    newCol++;
                } else if (direction === 'left' && newCol > 0) {
                    newCol--;
                } else if (direction === 'up' && newRow > 0) {
                    newRow--;
                } else if (direction === 'down' && newRow < 99) {
                    newRow++;
                }

                // 새로운 머리 위치를 배열의 맨 앞에 추가
                snake.unshift([newRow, newCol]);

                // 지렁이가 최대 길이를 초과하면 마지막 요소 제거
                if (snake.length > maxLength) {
                    snake.pop();
                }

                // 새로운 위치에 user 클래스 추가
                for (let i = 0; i < snake.length; i++) {
                    const [row, col] = snake[i];
                    $('#' + row + '_' + col).addClass('user');
                }

                moveMonsters(); // 몬스터 이동
                checkCollision(); // 충돌 체크
                collectCoins(); // 코인 수집 체크
            }
        }, 100); // 0.1초마다 이동
        initializeCoins(); // 코인 초기화
        initializeMonsters(); // 몬스터 초기화
    });
</script>

</body>
</html>