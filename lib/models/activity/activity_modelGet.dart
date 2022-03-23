// To parse this JSON data, do
//
//     final activityModelGet = activityModelGetFromJson(jsonString);

import 'dart:convert';

ActivityModelGet activityModelGetFromJson(String str) => ActivityModelGet.fromJson(json.decode(str));

String activityModelGetToJson(ActivityModelGet data) => json.encode(data.toJson());

class ActivityModelGet {
    ActivityModelGet({
      this.taskId,
      this.dateEnd,
      this.dateStart,
    });

    String taskId;
    String dateEnd;
    String dateStart;

    factory ActivityModelGet.fromJson(Map<String, dynamic> json) => ActivityModelGet(
        taskId: json["taskId"],
        dateEnd: json["date_end"],
        dateStart: json["date_start"],
    );

    Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "date_end": dateEnd,
        "date_start": dateStart,
    };
}
