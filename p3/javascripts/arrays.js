//P3 4-A
var arrAvg = function (nums) {
	var sumSoFar = 0,
	i;

	//loop over the array, adding the sum
	for (i = 0; i < nums.length; i++) {
		sumSoFar = sumSoFar + nums[i];
	}

	var avg = sumSoFar / nums.length;
	return avg;
};

//P3 4-B
var arrMax = function (nums) {
	var largest = Math.max.apply(Math, nums);
	return largest;
}

//P3 4-C
var isMember = function (nums, n) {
	
}

var arr = [1, 2, 3, 4, 5];

var mystery = function(nums) {
	for (i = 0; i < nums.length; i++)
		if (nums = arr[i]) {
			return true;
		}
    }
