' VBScript для отправки вебхука в скрытом (асинхронном) режиме с именем компьютера

' 1. Получение имени компьютера (HOST NAME)
Set objShell = CreateObject("WScript.Shell")
strComputerName = objShell.ExpandEnvironmentStrings("%COMPUTERNAME%")

' 2. Настройка запроса (HTTP GET Request)
strURL = "<SET_YOUR_WEBHOOK>"

' Добавляем имя компьютера в качестве параметра запроса
strURLWithParam = strURL & "?computer=" & strComputerName

' 3. Создание HTTP-объекта
Set objHTTP = CreateObject("MSXML2.XMLHTTP")

' 4. Открытие и отправка запроса
' 4.1. "GET" - тип запроса
' 4.2. strURLWithParam - URL с параметром имени компьютера
' 4.3. False - Синхронный режим. Скрипт ждет ответа от сервера.
objHTTP.open "GET", strURLWithParam, False 

' 5. Отправка запроса
objHTTP.send

' 6. Очистка объектов
' Поскольку запрос отправлен асинхронно, мы можем сразу завершить скрипт.
Set objHTTP = Nothing
Set objShell = Nothing