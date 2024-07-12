-- 找出某一天，各家分行總共有多少通不合格且未覆核音檔
SELECT 
      [empDeptName]
      ,COUNT(DISTINCT pid) AS cnt
  FROM [fz_INU].[dbo].[inuMain]
  WHERE startTime BETWEEN '2024-03-15 00:00:00.000' AND '2024-03-15 23:59:59.000'
  AND passed = 0
  AND isClosed = 0
  GROUP BY empDeptName

  
-- 找出某一天，各家分行有多少通不合格且未覆核音檔(按質檢表分類)
SELECT 
      [empDeptName]
	,[taskName]
      ,COUNT(DISTINCT pid) AS cnt
  FROM [fz_INU].[dbo].[inuMain]
  WHERE startTime BETWEEN '2024-03-15 00:00:00.000' AND '2024-03-15 23:59:59.000'
  AND passed = 0
  AND isClosed = 0
  GROUP BY empDeptName, taskName


-- 找出2月，各家分行的D3、D4質檢表有多少通音檔/不合格音檔/完成人工覆核音檔
SELECT
	[empDeptId]
	, [empDeptName]
	, [productDescription]
	, count(distinct pid) as [所有音檔數]
	, count(case when passed = '0' then 1 end) as [不合格音檔數]
	, sum(isClosed) as [完成人工覆核音檔數]
  FROM [fz_INU].[dbo].[inuMain]
  WHERE [endTime] between '2024-02-01' and '2024-02-29'
  and productDescription like 'D[3-4]%'
  GROUP BY [empDeptId],[empDeptName],[productDescription]
  ORDER BY [empDeptId],[empDeptName],[productDescription]
