function advicePage() {
  if (localStorage.getItem("tbRecords") ===
    null) {
    alert("No records exist.");

    $(location).attr("href", "#pageMenu");
  } else {

    var user = JSON.parse(localStorage.getItem(
      "user"));
    var TSHLevel = user.TSHRange;

    var tbRecords = JSON.parse(localStorage.getItem(
      "tbRecords"));
    tbRecords.sort(compareDates);
    var i = tbRecords.length - 1;
    var TSH = tbRecords[i].SynthroidDose;

    var c = document.getElementById(
      "AdviceCanvas");
    var ctx = c.getContext("2d");
    ctx.fillStyle = "#c0c0c0";
    ctx.fillRect(0, 0, 550, 550);
    ctx.font = "22px Arial";
    drawAdviceCanvas(ctx, TSHLevel, TSH);

  }
}

function drawAdviceCanvas(ctx, TSHLevel, TSH) {
  ctx.font = "22px Arial";
  ctx.fillStyle = "black";
  ctx.fillText("Your current BMI is " + TSH +
    ".", 25, 320);
  var TSHLevel = "StageB"

  if (TSHLevel == "StageA") {
    ctx.fillText(
      "Your target BMI range is: 18.5-24.9.",
      25, 350);
    levelAwrite(ctx, TSH);
    levelAMeter(ctx, TSH);
  } else if (TSHLevel == "StageB") {
    ctx.fillText(
      "Your target BMI range is: 18.5-24.9",
      25, 350);
    levelBwrite(ctx, TSH);
    levelBMeter(ctx, TSH);
  } else if (TSHLevel == "StageC") {
    ctx.fillText(
      "Your target BMI range is: 18.5-24.9",
      25, 350);
    levelCwrite(ctx, TSH);
    levelCMeter(ctx, TSH);
  }
}

//For deciding what to write for given values of TSH level A
/*
function levelAwrite(ctx, TSH) {
  if ((TSH >= 0) && (TSH <= 18.5)) {
    writeAdvice(ctx, "underweight");
  } else if ((TSH > 18.5) && (TSH <= 24.9)) {
    writeAdvice(ctx, "normal weight");
  } else if ((TSH > 25) && (TSH <= 29.9)) {
    writeAdvice(ctx, "over weight");
  } else if ((TSH > 30) && (TSH <= 34.9)) {
    writeAdvice(ctx, "class I obesity");
  } else if ((TSH > 35) && (TSH <= 39.9)) {
    writeAdvice(ctx, "class II obesity");
  }  else {
    writeAdvice(ctx, "class III obesity");
  }
}
*/
function levelBwrite(ctx, TSH) {
  if ((TSH >= 10) && (TSH <= 18.4)) {
    writeAdvice(ctx, "yellow");
  } else if ((TSH > 18.5) && (TSH <= 24.9)) {
    writeAdvice(ctx, "green");
  } else if ((TSH >= 25) && (TSH < 29.9)) {
    writeAdvice(ctx, "yellow");
  } else {
    writeAdvice(ctx, "red");
  }
}
/*
function levelCwrite(ctx, TSH) {
  if ((TSH >= 0.35) && (TSH <= 2.0)) {
    writeAdvice(ctx, "green");
  } else if ((TSH > 2) && (TSH <= 10)) {
    writeAdvice(ctx, "yellow");
  } else if ((TSH >= 0.1) && (TSH < 0.35)) {
    writeAdvice(ctx, "yellow");
  } else {
    writeAdvice(ctx, "red");
  }
}
*/
function writeAdvice(ctx, level) {
  var adviceLine1 = "";
  var adviceLine2 = "";

  if (level == "red") {
    adviceLine1 =
      "Your BMI classification is class I obesity or higher.";
    adviceLine2 = "Please consult with your family physician urgently.";
  } else if (level == "yellow") {
    adviceLine1 =
      "Keep up the good work and you'll have a";
    adviceLine2 = "normal BMI in no time!";
  } else if (level = "green") {
    adviceLine1 =
      "Great job! Your BMI is right where you want it to be.";
    adviceLine2 =
      "Keep up the healthy lifestyle!"
  }
  ctx.fillText("Your BMI level is " + level +
    ".", 25, 380);
  ctx.fillText(adviceLine1, 25, 410);
  ctx.fillText(adviceLine2, 25, 440);
}
/*
function levelAMeter(ctx, TSH) {
  if (TSH <= 3) {
    var cg = new RGraph.CornerGauge(
        "AdviceCanvas", 0, 3, TSH)
      .Set("chart.colors.ranges", [
        [0.5, 3, "red"],
        [0.1, 0.5, "yellow"],
        [0.01, 0.1, "#0f0"]
      ]);
  } else {
    var cg = new RGraph.CornerGauge(
        "AdviceCanvas", 0, TSH, TSH)
      .Set("chart.colors.ranges", [
        [0.5, 3, "red"],
        [0.1, 0.5, "yellow"],
        [0.01, 0.1, "#0f0"],
        [3.01, TSH, "red"]
      ]);
  }
  drawMeter(cg);
}
*/
function levelBMeter(ctx, TSH) {
  if (TSH <= 50) {
    var bcg = new RGraph.CornerGauge(
        "AdviceCanvas", 10, 35, TSH)
      .Set("chart.colors.ranges", [
        [30, 35, "red"],
        [25, 29.9, "yellow"],
        [18.5, 24.9, "#0f0"],
        [10, 18.4, "yellow"]
      ]);
  } else {
    var bcg = new RGraph.CornerGauge(
        "AdviceCanvas", 0, TSH, TSH)
      .Set("chart.colors.ranges", [
        [30, 34.9, "red"],
        [25, 29.9, "yellow"],
        [18.5, 24.9, "#0f0"],
        [10, 18.4, "yellow"],
        [35, TSH, "red"]
      ]);
  }
  drawMeter(bcg);
}
/*
function levelCMeter(ctx, TSH) {
  if (TSH <= 50) {
    var ccg = new RGraph.CornerGauge(
        "AdviceCanvas", 0, 15, TSH)
      .Set("chart.colors.ranges", [
        [10.01, 15, "red"],
        [2.01, 10, "yellow"],
        [0.35, 2, "#0f0"],
        [0.1, .34, "yellow"]
      ]);
  } else {
    var ccg = new RGraph.CornerGauge(
        "AdviceCanvas", 0, TSH, TSH)
      .Set("chart.colors.ranges", [
        [10.01, 15, "red"],
        [2.01, 10, "yellow"],
        [0.35, 2, "#0f0"],
        [0.1, 0.34, "yellow"],
        [15.01, TSH, "red"]
      ]);
  }
  drawMeter(ccg);
}
*/
// Meter properties
function drawMeter(g) {
  //g.Set("chart.value.text.units.post", "BMI")
    g.Set("chart.value.text.boxed", false)
    .Set("chart.value.text.size", 14)
    .Set("chart.value.text.font", "Verdana")
    .Set("chart.value.text.bold", true)
    .Set("chart.value.text.decimals", 2)
    .Set("chart.shadow.offsetx", 5)
    .Set("chart.shadow.offsety", 5)
    .Set("chart.scale.decimals", 2)
    .Set("chart.title", "BMI LEVEL")
    .Set("chart.radius", 250)
    .Set("chart.centerx", 50)
    .Set("chart.centery", 250)
    .Draw();
}