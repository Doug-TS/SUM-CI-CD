classdef sumActionTest < matlab.unittest.TestCase
    methods(Test)
        function addTwoNumbers(t)
            testCase_x = 5;
            testCase_y = 6;
            expected = 11;
            t.verifyEqual(sumAction(testCase_x, testCase_y), expected);
        end

        function addVectors(t)
            testCase_x = [1,2,3];
            testCase_y = [4,5,6];
            expected = [5,7,9];
            t.verifyEqual(sumAction(testCase_x, testCase_y),expected);
        end

    end
end