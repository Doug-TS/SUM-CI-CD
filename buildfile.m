function plan = buildfile
% Build plan with two tasks: test then report.
import matlab.buildtool.tasks.*
plan = buildplan(localfunctions);
plan("report").Dependencies = "test";
end

function testTask(~)
% Run all tests (including subfolders) and fail if any test fails.
results = runtests('IncludeSubfolders', true, 'OutputDetail', 'concise');
assertSuccess(results);
end

function reportTask(~)
% Make a tiny HTML page we can "deploy" via GitHub Pages.
if ~exist('docs','dir'); mkdir docs; end
fid = fopen(fullfile('docs','index.html'),'w');
fprintf(fid, ['<html><head><meta charset="utf-8"><title>MATLAB CI</title></head>' ...
              '<body><h1>MATLAB CI passed ✅</h1>' ...
              '<p>Generated on %s</p>' ...
              '<p>All unit tests passed. 🎉</p></body></html>'], datestr(now));
fclose(fid);
end
