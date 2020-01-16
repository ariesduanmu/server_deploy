matplotlib中文显示为方框(ubuntu)

先下载字体SimHei.ttf[https://github.com/StellarCN/scp_zh/blob/master/fonts/SimHei.ttf]下载

查找matplotlib配置路径

```
import matplotlib
print (matplotlib.matplotlib_fname())
```

或者 `locate -b "\mpl-data"`

将字体放入.../matplotlib/mpl-data/fonts/ttf

删除`~/.cache/matplotlib`

编辑.../matplotlib/mpl-data/matplotlibrc

```
font.family         : sans-serif
font.sans-serif     : SimHei, ...
```