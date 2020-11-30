import java.util.Map;
import java.util.HashMap;

public class ArrayTwoSum {
    public static void main(String[] args) {
        int[] nums = {2, 7, 11, 15};
        int[] sum = twoSum(nums, 9);
        for (int i : sum) {
            System.out.println("两数之和结果" + sum[i]);
            // 0 
            // 1
        }
    }

    public static int[] twoSum(int[] nums, int target) {
        Map <Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int complete = target - nums[i];
            if (map.containsKey(complete)) {
                return new int[] { map.get(complete), i };
            }
            map.put(nums[i], i);
        }
        throw new IllegalArgumentException("No two sum solution");
    }
}

