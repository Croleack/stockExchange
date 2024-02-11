Задание:
Реализуй сортировку таблицы по следующим полям: “дата изменения сделки“, “имя инструмента”, “цена сделки”, “объем сделки” и “сторона сделки”. 
При этом по умолчанию отсортируй таблицу по полю “дата изменения сделки“. Так же реализуй интерфейс изменения направления сортровки.
Приходящие сделки перед отображением сортируй согласно выбранным параметрам сортировки.
После вызова метода subscribeToDeals, в callback асинхронно будут приходить пачки по 100 сделок.
Они будут приходить до тех пор, пока не закончатся. Общее количество сделок - около одного миллиона.

Решение:
SwiftUI. Архитектура MVVM + combine. Тесты писал только на ViewModel. 
Видео: https://drive.google.com/file/d/1GPB77_rY38y94o50bYknVkVRVa_LG_fp/view?usp=share_link

Exercise:
Implement sorting the table by the following fields: “date of transaction change”, “instrument name”, “transaction price”, “transaction volume”
and “side of transaction”.
In this case, by default, sort the table by the “date of transaction change” field. Also implement an interface for changing the sorting direction.
Before displaying, sort incoming transactions according to the selected sorting parameters.
After calling the subscribeToDeals method, packs of 100 deals will be sent to the callback asynchronously.
They will come until they run out. The total number of transactions is about one million.

Solution:
SwiftUI. MVVM + combine architecture. I wrote tests only on ViewModel.
Video: https://drive.google.com/file/d/1GPB77_rY38y94o50bYknVkVRVa_LG_fp/view?usp=share_link


<img width="989" alt="Снимок экрана 2024-01-28 в 15 03 55" src="https://github.com/Croleack/stockExchange/assets/121854191/b4aea046-3d58-44dc-b2e7-29145479a016">
<img width="943" alt="Снимок экрана 2024-01-28 в 13 24 15" src="https://github.com/Croleack/stockExchange/assets/121854191/d257611d-e1d3-49dd-b0b4-d79f7eabebe0">



