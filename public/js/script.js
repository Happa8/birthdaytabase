/*
今日から任意の日までの日数を求める。

使用方法:
getRemainDay(月,日);

使用例:
// 今日は2015年12月19日であるとする。
// 袴田ひなた/小鳥遊ひなの誕生日(3月3日(ひな祭り!!!))までの日数を求める。
getRemainDay(3,3); // => 75
*/



// 今日の日付を取得。
var today = new Date();
var thisYear = today.getFullYear(); // 今年の年を取得。

var d = (today.getDate() < 10 ? "0" + today.getDate() : today.getDate()) + ""; // 0埋めした今日の日付け
var m = (today.getMonth() + 1 < 10 ? "0" + (today.getMonth() + 1 ) : today.getMonth() + 1) + ""; // 0埋めした今月の月

function getRemainDay(M, D) {
    M = --M; // 女子小学生のDate型の月は0始まりなので1引く。
    var birthday = new Date(thisYear, M, D); // 与えられた情報(月,日)を元に今年の日付を作成。

    if (today > birthday) { // もし誕生日を過ぎていたら、
        birthday.setFullYear(thisYear + 1); // 誕生日を来年にする。
    }

    var remain = birthday.getTime() - today.getTime(); // 今日と誕生日までの差(単位ミリ秒)を求める。
    var remainDay = Math.floor(remain / (24 * 60 * 60 * 1000)); // ミリ秒を日にちに直す。
    remainDay = ++remainDay; // 一日少なくなってしまうので足す。

    return remainDay; // 値を返す。
}

$(function(){
    $(".delete").on('click',function(){
        return confirm("削除します。\nよろしいですか？")
    })
});

function wrd(date){
    var rd = getRemainDay(date.slice(0,2),date.slice(2));
    document.write(rd == 365 ? "<span class=\"celebrate\">誕生日は今日です<br>おめでとうございます！</span>" : "あと<span close=\"date\">" + rd + "日");
}

function wd(date){
    var m = date.slice(0,2) - 0;
    var d = date.slice(2) - 0;
    document.write(m  + "/" + d );
}