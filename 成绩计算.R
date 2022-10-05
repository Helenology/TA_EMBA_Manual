library(readxl)

grade = read_excel('/Users/helenology/Desktop/emba成绩计算/副本07-数据思维：从不确定性中发掘商业价值.xls',
                   skip=3)

path = '/Users/helenology/Desktop/emba成绩计算/'
files_candidate = list.files(path)

for(i in 1:length(files_candidate)){
  # 如果是课后测验
  if(grepl('课后测试', files_candidate[i])){
    test_path = paste0(path, files_candidate[i])
    test = read_excel(test_path)
    test = test[, c('用户ID', '总分')]
    names(test) = c('姓名', strsplit(files_candidate[i], '-')[[1]][1])
    grade = merge(grade, test, by='姓名', all.x=T)
    print("Adding a test")
    }
}

# 保存成绩单
grade = grade[order(as.numeric(grade$序号), decreasing = F), ]
write.csv(grade, paste0(path, "数据思维详细成绩单.csv"))

library(readxl)

grade = read_excel('/Users/helenology/Desktop/emba成绩计算/07-数据思维：从不确定性中发掘商业价值-成绩单.xls',
                   skip = 3)

bb = data.frame(table(a))
bb$a = factor(bb$a, 
              levels = c("A+", "A", "A-", "B+", "B", "B-", "C+", "D+"))

library(ggplot2)

ggplot(bb, aes(x = a, y = Freq)) +
  geom_bar(stat = "identity") +
  labs(x = "等级成绩", y = "频数") +
  theme_gray(base_family = "STKaiti")
