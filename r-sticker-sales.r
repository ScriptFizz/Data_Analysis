{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "ea7fbefd",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:03.967758Z",
     "iopub.status.busy": "2025-01-03T15:32:03.965644Z",
     "iopub.status.idle": "2025-01-03T15:32:05.595856Z",
     "shell.execute_reply": "2025-01-03T15:32:05.593765Z"
    },
    "papermill": {
     "duration": 1.643011,
     "end_time": "2025-01-03T15:32:05.598632",
     "exception": false,
     "start_time": "2025-01-03T15:32:03.955621",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32marrange()\u001b[39m     masks \u001b[34mplyr\u001b[39m::arrange()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mbetween()\u001b[39m     masks \u001b[34mdata.table\u001b[39m::between()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mpurrr\u001b[39m::\u001b[32mcompact()\u001b[39m     masks \u001b[34mplyr\u001b[39m::compact()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mcount()\u001b[39m       masks \u001b[34mplyr\u001b[39m::count()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mdesc()\u001b[39m        masks \u001b[34mplyr\u001b[39m::desc()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfailwith()\u001b[39m    masks \u001b[34mplyr\u001b[39m::failwith()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m      masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfirst()\u001b[39m       masks \u001b[34mdata.table\u001b[39m::first()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mhour()\u001b[39m    masks \u001b[34mdata.table\u001b[39m::hour()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mid()\u001b[39m          masks \u001b[34mplyr\u001b[39m::id()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32misoweek()\u001b[39m masks \u001b[34mdata.table\u001b[39m::isoweek()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m         masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlast()\u001b[39m        masks \u001b[34mdata.table\u001b[39m::last()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mmday()\u001b[39m    masks \u001b[34mdata.table\u001b[39m::mday()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mminute()\u001b[39m  masks \u001b[34mdata.table\u001b[39m::minute()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mmonth()\u001b[39m   masks \u001b[34mdata.table\u001b[39m::month()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mmutate()\u001b[39m      masks \u001b[34mplyr\u001b[39m::mutate()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mquarter()\u001b[39m masks \u001b[34mdata.table\u001b[39m::quarter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mrename()\u001b[39m      masks \u001b[34mplyr\u001b[39m::rename()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32msecond()\u001b[39m  masks \u001b[34mdata.table\u001b[39m::second()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32msummarise()\u001b[39m   masks \u001b[34mplyr\u001b[39m::summarise()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32msummarize()\u001b[39m   masks \u001b[34mplyr\u001b[39m::summarize()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mpurrr\u001b[39m::\u001b[32mtranspose()\u001b[39m   masks \u001b[34mdata.table\u001b[39m::transpose()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mwday()\u001b[39m    masks \u001b[34mdata.table\u001b[39m::wday()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32mweek()\u001b[39m    masks \u001b[34mdata.table\u001b[39m::week()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32myday()\u001b[39m    masks \u001b[34mdata.table\u001b[39m::yday()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mlubridate\u001b[39m::\u001b[32myear()\u001b[39m    masks \u001b[34mdata.table\u001b[39m::year()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'playground-series-s5e1'"
      ],
      "text/latex": [
       "'playground-series-s5e1'"
      ],
      "text/markdown": [
       "'playground-series-s5e1'"
      ],
      "text/plain": [
       "[1] \"playground-series-s5e1\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "options(conflicts.policy = list(warn = FALSE))\n",
    "library(data.table)\n",
    "library(plyr)\n",
    "library(dplyr)\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "db8db301",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:05.648255Z",
     "iopub.status.busy": "2025-01-03T15:32:05.616168Z",
     "iopub.status.idle": "2025-01-03T15:32:08.183776Z",
     "shell.execute_reply": "2025-01-03T15:32:08.181722Z"
    },
    "papermill": {
     "duration": 2.581437,
     "end_time": "2025-01-03T15:32:08.187854",
     "exception": false,
     "start_time": "2025-01-03T15:32:05.606417",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "corrplot 0.92 loaded\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Registered S3 method overwritten by 'GGally':\n",
      "  method from   \n",
      "  +.gg   ggplot2\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: lattice\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "randomForest 4.7-1.1\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Type rfNews() to see new features/changes/bug fixes.\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(scales) # visualisation\n",
    "library(corrplot) # visualisation\n",
    "library(GGally) # visualisation\n",
    "library(ggthemes) # visualisation\n",
    "library(maps) #maps\n",
    "library(visdat)\n",
    "#Date\n",
    "library(scales)\n",
    "library(zoo)\n",
    "library(caret)\n",
    "library(randomForest)\n",
    "library(rpart)\n",
    "library(xgboost)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "37615827",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:08.208292Z",
     "iopub.status.busy": "2025-01-03T15:32:08.206549Z",
     "iopub.status.idle": "2025-01-03T15:32:08.225085Z",
     "shell.execute_reply": "2025-01-03T15:32:08.223203Z"
    },
    "papermill": {
     "duration": 0.032153,
     "end_time": "2025-01-03T15:32:08.228382",
     "exception": false,
     "start_time": "2025-01-03T15:32:08.196229",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "sep <- function(text, len = 50){\n",
    "    print(paste(replicate(len, '--'), collapse = \"\"))\n",
    "    print(paste(c(replicate(len/2 - nchar(text), '  '), text), collapse = \"\"))\n",
    "    print(paste(replicate(len, '--'), collapse = \"\"))\n",
    "}\n",
    "\n",
    "fig <- function(x, y){\n",
    "    options(repr.plot.width = x, repr.plot.height = y)\n",
    "}"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "86fa246d",
   "metadata": {
    "papermill": {
     "duration": 0.008151,
     "end_time": "2025-01-03T15:32:08.244280",
     "exception": false,
     "start_time": "2025-01-03T15:32:08.236129",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<h3>Loading and looking at data</h3>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "385a5183",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:08.264111Z",
     "iopub.status.busy": "2025-01-03T15:32:08.262500Z",
     "iopub.status.idle": "2025-01-03T15:32:08.878099Z",
     "shell.execute_reply": "2025-01-03T15:32:08.876129Z"
    },
    "papermill": {
     "duration": 0.628341,
     "end_time": "2025-01-03T15:32:08.880930",
     "exception": false,
     "start_time": "2025-01-03T15:32:08.252589",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"----------------------------------------------------------------------------------------------------\"\n",
      "[1] \"                                        train\"\n",
      "[1] \"----------------------------------------------------------------------------------------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>date</th><th scope=col>country</th><th scope=col>store</th><th scope=col>product</th><th scope=col>num_sold</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Holographic Goose </td><td> NA</td></tr>\n",
       "\t<tr><td>1</td><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle            </td><td>973</td></tr>\n",
       "\t<tr><td>2</td><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle Tiers      </td><td>906</td></tr>\n",
       "\t<tr><td>3</td><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler          </td><td>423</td></tr>\n",
       "\t<tr><td>4</td><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler Dark Mode</td><td>491</td></tr>\n",
       "\t<tr><td>5</td><td>2010-01-01</td><td>Canada</td><td>Stickers for Less</td><td>Holographic Goose </td><td>300</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " id & date & country & store & product & num\\_sold\\\\\n",
       " <dbl> & <date> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0 & 2010-01-01 & Canada & Discount Stickers & Holographic Goose  &  NA\\\\\n",
       "\t 1 & 2010-01-01 & Canada & Discount Stickers & Kaggle             & 973\\\\\n",
       "\t 2 & 2010-01-01 & Canada & Discount Stickers & Kaggle Tiers       & 906\\\\\n",
       "\t 3 & 2010-01-01 & Canada & Discount Stickers & Kerneler           & 423\\\\\n",
       "\t 4 & 2010-01-01 & Canada & Discount Stickers & Kerneler Dark Mode & 491\\\\\n",
       "\t 5 & 2010-01-01 & Canada & Stickers for Less & Holographic Goose  & 300\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 6\n",
       "\n",
       "| id &lt;dbl&gt; | date &lt;date&gt; | country &lt;chr&gt; | store &lt;chr&gt; | product &lt;chr&gt; | num_sold &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 0 | 2010-01-01 | Canada | Discount Stickers | Holographic Goose  |  NA |\n",
       "| 1 | 2010-01-01 | Canada | Discount Stickers | Kaggle             | 973 |\n",
       "| 2 | 2010-01-01 | Canada | Discount Stickers | Kaggle Tiers       | 906 |\n",
       "| 3 | 2010-01-01 | Canada | Discount Stickers | Kerneler           | 423 |\n",
       "| 4 | 2010-01-01 | Canada | Discount Stickers | Kerneler Dark Mode | 491 |\n",
       "| 5 | 2010-01-01 | Canada | Stickers for Less | Holographic Goose  | 300 |\n",
       "\n"
      ],
      "text/plain": [
       "  id date       country store             product            num_sold\n",
       "1 0  2010-01-01 Canada  Discount Stickers Holographic Goose   NA     \n",
       "2 1  2010-01-01 Canada  Discount Stickers Kaggle             973     \n",
       "3 2  2010-01-01 Canada  Discount Stickers Kaggle Tiers       906     \n",
       "4 3  2010-01-01 Canada  Discount Stickers Kerneler           423     \n",
       "5 4  2010-01-01 Canada  Discount Stickers Kerneler Dark Mode 491     \n",
       "6 5  2010-01-01 Canada  Stickers for Less Holographic Goose  300     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"----------------------------------------------------------------------------------------------------\"\n",
      "[1] \"                                          test\"\n",
      "[1] \"----------------------------------------------------------------------------------------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>date</th><th scope=col>country</th><th scope=col>store</th><th scope=col>product</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>230130</td><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Holographic Goose </td></tr>\n",
       "\t<tr><td>230131</td><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle            </td></tr>\n",
       "\t<tr><td>230132</td><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle Tiers      </td></tr>\n",
       "\t<tr><td>230133</td><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler          </td></tr>\n",
       "\t<tr><td>230134</td><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler Dark Mode</td></tr>\n",
       "\t<tr><td>230135</td><td>2017-01-01</td><td>Canada</td><td>Stickers for Less</td><td>Holographic Goose </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " id & date & country & store & product\\\\\n",
       " <dbl> & <date> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 230130 & 2017-01-01 & Canada & Discount Stickers & Holographic Goose \\\\\n",
       "\t 230131 & 2017-01-01 & Canada & Discount Stickers & Kaggle            \\\\\n",
       "\t 230132 & 2017-01-01 & Canada & Discount Stickers & Kaggle Tiers      \\\\\n",
       "\t 230133 & 2017-01-01 & Canada & Discount Stickers & Kerneler          \\\\\n",
       "\t 230134 & 2017-01-01 & Canada & Discount Stickers & Kerneler Dark Mode\\\\\n",
       "\t 230135 & 2017-01-01 & Canada & Stickers for Less & Holographic Goose \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| id &lt;dbl&gt; | date &lt;date&gt; | country &lt;chr&gt; | store &lt;chr&gt; | product &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 230130 | 2017-01-01 | Canada | Discount Stickers | Holographic Goose  |\n",
       "| 230131 | 2017-01-01 | Canada | Discount Stickers | Kaggle             |\n",
       "| 230132 | 2017-01-01 | Canada | Discount Stickers | Kaggle Tiers       |\n",
       "| 230133 | 2017-01-01 | Canada | Discount Stickers | Kerneler           |\n",
       "| 230134 | 2017-01-01 | Canada | Discount Stickers | Kerneler Dark Mode |\n",
       "| 230135 | 2017-01-01 | Canada | Stickers for Less | Holographic Goose  |\n",
       "\n"
      ],
      "text/plain": [
       "  id     date       country store             product           \n",
       "1 230130 2017-01-01 Canada  Discount Stickers Holographic Goose \n",
       "2 230131 2017-01-01 Canada  Discount Stickers Kaggle            \n",
       "3 230132 2017-01-01 Canada  Discount Stickers Kaggle Tiers      \n",
       "4 230133 2017-01-01 Canada  Discount Stickers Kerneler          \n",
       "5 230134 2017-01-01 Canada  Discount Stickers Kerneler Dark Mode\n",
       "6 230135 2017-01-01 Canada  Stickers for Less Holographic Goose "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "train = read_csv('../input/playground-series-s5e1/train.csv', show_col_types = FALSE)\n",
    "test = read_csv('../input/playground-series-s5e1/test.csv', show_col_types = FALSE)\n",
    "sep('train')\n",
    "head(train)\n",
    "sep('test')\n",
    "head(test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "30906ccf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:08.901322Z",
     "iopub.status.busy": "2025-01-03T15:32:08.899695Z",
     "iopub.status.idle": "2025-01-03T15:32:08.936401Z",
     "shell.execute_reply": "2025-01-03T15:32:08.934605Z"
    },
    "papermill": {
     "duration": 0.049399,
     "end_time": "2025-01-03T15:32:08.938739",
     "exception": false,
     "start_time": "2025-01-03T15:32:08.889340",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>date</th><th scope=col>country</th><th scope=col>store</th><th scope=col>product</th><th scope=col>num_sold</th></tr>\n",
       "\t<tr><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Holographic Goose </td><td> NA</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle            </td><td>973</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle Tiers      </td><td>906</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler          </td><td>423</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler Dark Mode</td><td>491</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Stickers for Less</td><td>Holographic Goose </td><td>300</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " date & country & store & product & num\\_sold\\\\\n",
       " <date> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Holographic Goose  &  NA\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kaggle             & 973\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kaggle Tiers       & 906\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kerneler           & 423\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kerneler Dark Mode & 491\\\\\n",
       "\t 2010-01-01 & Canada & Stickers for Less & Holographic Goose  & 300\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| date &lt;date&gt; | country &lt;chr&gt; | store &lt;chr&gt; | product &lt;chr&gt; | num_sold &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 2010-01-01 | Canada | Discount Stickers | Holographic Goose  |  NA |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kaggle             | 973 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kaggle Tiers       | 906 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kerneler           | 423 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kerneler Dark Mode | 491 |\n",
       "| 2010-01-01 | Canada | Stickers for Less | Holographic Goose  | 300 |\n",
       "\n"
      ],
      "text/plain": [
       "  date       country store             product            num_sold\n",
       "1 2010-01-01 Canada  Discount Stickers Holographic Goose   NA     \n",
       "2 2010-01-01 Canada  Discount Stickers Kaggle             973     \n",
       "3 2010-01-01 Canada  Discount Stickers Kaggle Tiers       906     \n",
       "4 2010-01-01 Canada  Discount Stickers Kerneler           423     \n",
       "5 2010-01-01 Canada  Discount Stickers Kerneler Dark Mode 491     \n",
       "6 2010-01-01 Canada  Stickers for Less Holographic Goose  300     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "test_ids <- test$id\n",
    "test$id <- NULL\n",
    "train$id <- NULL\n",
    "head(train)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae3b9405",
   "metadata": {
    "papermill": {
     "duration": 0.008825,
     "end_time": "2025-01-03T15:32:08.956439",
     "exception": false,
     "start_time": "2025-01-03T15:32:08.947614",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<h3>Dataset informations</h3>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "731c174b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:08.978798Z",
     "iopub.status.busy": "2025-01-03T15:32:08.977079Z",
     "iopub.status.idle": "2025-01-03T15:32:09.045937Z",
     "shell.execute_reply": "2025-01-03T15:32:09.043677Z"
    },
    "papermill": {
     "duration": 0.083466,
     "end_time": "2025-01-03T15:32:09.048485",
     "exception": false,
     "start_time": "2025-01-03T15:32:08.965019",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"----------------------------------------------------------------------------------------------------\"\n",
      "[1] \"                                        train\"\n",
      "[1] \"----------------------------------------------------------------------------------------------------\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [230,130 × 5] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ date    : Date[1:230130], format: \"2010-01-01\" \"2010-01-01\" ...\n",
      " $ country : chr [1:230130] \"Canada\" \"Canada\" \"Canada\" \"Canada\" ...\n",
      " $ store   : chr [1:230130] \"Discount Stickers\" \"Discount Stickers\" \"Discount Stickers\" \"Discount Stickers\" ...\n",
      " $ product : chr [1:230130] \"Holographic Goose\" \"Kaggle\" \"Kaggle Tiers\" \"Kerneler\" ...\n",
      " $ num_sold: num [1:230130] NA 973 906 423 491 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   date = \u001b[34mcol_date(format = \"\")\u001b[39m,\n",
      "  ..   country = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   store = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   product = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   num_sold = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"----------------------------------------------------------------------------------------------------\"\n",
      "[1] \"                                          test\"\n",
      "[1] \"----------------------------------------------------------------------------------------------------\"\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [98,550 × 4] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ date   : Date[1:98550], format: \"2017-01-01\" \"2017-01-01\" ...\n",
      " $ country: chr [1:98550] \"Canada\" \"Canada\" \"Canada\" \"Canada\" ...\n",
      " $ store  : chr [1:98550] \"Discount Stickers\" \"Discount Stickers\" \"Discount Stickers\" \"Discount Stickers\" ...\n",
      " $ product: chr [1:98550] \"Holographic Goose\" \"Kaggle\" \"Kaggle Tiers\" \"Kerneler\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   date = \u001b[34mcol_date(format = \"\")\u001b[39m,\n",
      "  ..   country = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   store = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   product = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "sep('train')\n",
    "str(train)\n",
    "sep('test')\n",
    "str(test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "d9aeb3a3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:09.071482Z",
     "iopub.status.busy": "2025-01-03T15:32:09.069689Z",
     "iopub.status.idle": "2025-01-03T15:32:09.131744Z",
     "shell.execute_reply": "2025-01-03T15:32:09.129930Z"
    },
    "papermill": {
     "duration": 0.076721,
     "end_time": "2025-01-03T15:32:09.134235",
     "exception": false,
     "start_time": "2025-01-03T15:32:09.057514",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"----------------------------------------------------------------------------------------------------\"\n",
      "[1] \"                                        train\"\n",
      "[1] \"----------------------------------------------------------------------------------------------------\"\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "      date              country             store             product         \n",
       " Min.   :2010-01-01   Length:230130      Length:230130      Length:230130     \n",
       " 1st Qu.:2011-10-02   Class :character   Class :character   Class :character  \n",
       " Median :2013-07-02   Mode  :character   Mode  :character   Mode  :character  \n",
       " Mean   :2013-07-02                                                           \n",
       " 3rd Qu.:2015-04-02                                                           \n",
       " Max.   :2016-12-31                                                           \n",
       "                                                                              \n",
       "    num_sold     \n",
       " Min.   :   5.0  \n",
       " 1st Qu.: 219.0  \n",
       " Median : 605.0  \n",
       " Mean   : 752.5  \n",
       " 3rd Qu.:1114.0  \n",
       " Max.   :5939.0  \n",
       " NA's   :8871    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sep('train')\n",
    "summary(train)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4e56286e",
   "metadata": {
    "papermill": {
     "duration": 0.00996,
     "end_time": "2025-01-03T15:32:09.153321",
     "exception": false,
     "start_time": "2025-01-03T15:32:09.143361",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<h3>Data prepraration</h3>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "899a3460",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:09.176950Z",
     "iopub.status.busy": "2025-01-03T15:32:09.175268Z",
     "iopub.status.idle": "2025-01-03T15:32:10.098607Z",
     "shell.execute_reply": "2025-01-03T15:32:10.096785Z"
    },
    "papermill": {
     "duration": 0.938631,
     "end_time": "2025-01-03T15:32:10.101370",
     "exception": false,
     "start_time": "2025-01-03T15:32:09.162739",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>date</th><th scope=col>country</th><th scope=col>store</th><th scope=col>product</th><th scope=col>num_sold</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>weekday</th></tr>\n",
       "\t<tr><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Holographic Goose </td><td> NA</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle            </td><td>973</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle Tiers      </td><td>906</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler          </td><td>423</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler Dark Mode</td><td>491</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Stickers for Less</td><td>Holographic Goose </td><td>300</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " date & country & store & product & num\\_sold & year & month & day & weekday\\\\\n",
       " <date> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Holographic Goose  &  NA & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kaggle             & 973 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kaggle Tiers       & 906 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kerneler           & 423 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kerneler Dark Mode & 491 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Stickers for Less & Holographic Goose  & 300 & 2010 & 1 & 1 & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 9\n",
       "\n",
       "| date &lt;date&gt; | country &lt;chr&gt; | store &lt;chr&gt; | product &lt;chr&gt; | num_sold &lt;dbl&gt; | year &lt;dbl&gt; | month &lt;dbl&gt; | day &lt;int&gt; | weekday &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 2010-01-01 | Canada | Discount Stickers | Holographic Goose  |  NA | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kaggle             | 973 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kaggle Tiers       | 906 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kerneler           | 423 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kerneler Dark Mode | 491 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Stickers for Less | Holographic Goose  | 300 | 2010 | 1 | 1 | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "  date       country store             product            num_sold year month\n",
       "1 2010-01-01 Canada  Discount Stickers Holographic Goose   NA      2010 1    \n",
       "2 2010-01-01 Canada  Discount Stickers Kaggle             973      2010 1    \n",
       "3 2010-01-01 Canada  Discount Stickers Kaggle Tiers       906      2010 1    \n",
       "4 2010-01-01 Canada  Discount Stickers Kerneler           423      2010 1    \n",
       "5 2010-01-01 Canada  Discount Stickers Kerneler Dark Mode 491      2010 1    \n",
       "6 2010-01-01 Canada  Stickers for Less Holographic Goose  300      2010 1    \n",
       "  day weekday\n",
       "1 1   6      \n",
       "2 1   6      \n",
       "3 1   6      \n",
       "4 1   6      \n",
       "5 1   6      \n",
       "6 1   6      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "decode_date <- function(df){\n",
    "    date_idx = which(sapply(df, is.Date))\n",
    "    df <- df %>% mutate(\n",
    "                        year = year(df[[date_idx]]),\n",
    "                        month = month(df[[date_idx]]),\n",
    "                        day = day(df[[date_idx]]),\n",
    "                        weekday = wday(df[[date_idx]])                     \n",
    "                        )\n",
    "    return(df)\n",
    "}\n",
    "\n",
    "train <- decode_date(train)\n",
    "test <- decode_date(test)\n",
    "head(train)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "903bfee0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:10.123997Z",
     "iopub.status.busy": "2025-01-03T15:32:10.122389Z",
     "iopub.status.idle": "2025-01-03T15:32:10.187570Z",
     "shell.execute_reply": "2025-01-03T15:32:10.185811Z"
    },
    "papermill": {
     "duration": 0.078944,
     "end_time": "2025-01-03T15:32:10.189953",
     "exception": false,
     "start_time": "2025-01-03T15:32:10.111009",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>date</dt><dd>2557</dd><dt>country</dt><dd>6</dd><dt>store</dt><dd>3</dd><dt>product</dt><dd>5</dd><dt>num_sold</dt><dd>4038</dd><dt>year</dt><dd>7</dd><dt>month</dt><dd>12</dd><dt>day</dt><dd>31</dd><dt>weekday</dt><dd>7</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[date] 2557\n",
       "\\item[country] 6\n",
       "\\item[store] 3\n",
       "\\item[product] 5\n",
       "\\item[num\\textbackslash{}\\_sold] 4038\n",
       "\\item[year] 7\n",
       "\\item[month] 12\n",
       "\\item[day] 31\n",
       "\\item[weekday] 7\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "date\n",
       ":   2557country\n",
       ":   6store\n",
       ":   3product\n",
       ":   5num_sold\n",
       ":   4038year\n",
       ":   7month\n",
       ":   12day\n",
       ":   31weekday\n",
       ":   7\n",
       "\n"
      ],
      "text/plain": [
       "    date  country    store  product num_sold     year    month      day \n",
       "    2557        6        3        5     4038        7       12       31 \n",
       " weekday \n",
       "       7 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "number_of_unique <- train %>% sapply(unique) %>% sapply(length)\n",
    "number_of_unique"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "b548d873",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:10.212532Z",
     "iopub.status.busy": "2025-01-03T15:32:10.210898Z",
     "iopub.status.idle": "2025-01-03T15:32:10.248081Z",
     "shell.execute_reply": "2025-01-03T15:32:10.246232Z"
    },
    "papermill": {
     "duration": 0.05118,
     "end_time": "2025-01-03T15:32:10.250484",
     "exception": false,
     "start_time": "2025-01-03T15:32:10.199304",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "target:  num_sold \n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Numerical feats:  year month day weekday \n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Categorical feats:  country store product \n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Low cardinality feats:  country store product year weekday"
     ]
    }
   ],
   "source": [
    "target <- c('num_sold')\n",
    "numeric_idx <- which(sapply(train, is.numeric))\n",
    "NUM_FEATS <- setdiff(names(numeric_idx), target)\n",
    "\n",
    "low_card_idx <- which(number_of_unique < 10)\n",
    "LOW_CARD_FEATS <- names(low_card_idx)\n",
    "\n",
    "CAT_FEATS <- setdiff(LOW_CARD_FEATS, NUM_FEATS)\n",
    "\n",
    "cat('target: ', target, '\\n')\n",
    "cat('Numerical feats: ', NUM_FEATS, '\\n')\n",
    "cat('Categorical feats: ', CAT_FEATS, '\\n')\n",
    "cat('Low cardinality feats: ', LOW_CARD_FEATS)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "56f3d547",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:10.273426Z",
     "iopub.status.busy": "2025-01-03T15:32:10.271762Z",
     "iopub.status.idle": "2025-01-03T15:32:10.355586Z",
     "shell.execute_reply": "2025-01-03T15:32:10.353718Z"
    },
    "papermill": {
     "duration": 0.098694,
     "end_time": "2025-01-03T15:32:10.358639",
     "exception": false,
     "start_time": "2025-01-03T15:32:10.259945",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"----------------------------------------------------------------------------------------------------\"\n",
      "[1] \"                                        train\"\n",
      "[1] \"----------------------------------------------------------------------------------------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>date</dt><dd>0</dd><dt>country</dt><dd>0</dd><dt>store</dt><dd>0</dd><dt>product</dt><dd>0</dd><dt>num_sold</dt><dd>8871</dd><dt>year</dt><dd>0</dd><dt>month</dt><dd>0</dd><dt>day</dt><dd>0</dd><dt>weekday</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[date] 0\n",
       "\\item[country] 0\n",
       "\\item[store] 0\n",
       "\\item[product] 0\n",
       "\\item[num\\textbackslash{}\\_sold] 8871\n",
       "\\item[year] 0\n",
       "\\item[month] 0\n",
       "\\item[day] 0\n",
       "\\item[weekday] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "date\n",
       ":   0country\n",
       ":   0store\n",
       ":   0product\n",
       ":   0num_sold\n",
       ":   8871year\n",
       ":   0month\n",
       ":   0day\n",
       ":   0weekday\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "    date  country    store  product num_sold     year    month      day \n",
       "       0        0        0        0     8871        0        0        0 \n",
       " weekday \n",
       "       0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"----------------------------------------------------------------------------------------------------\"\n",
      "[1] \"                                          test\"\n",
      "[1] \"----------------------------------------------------------------------------------------------------\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>date</dt><dd>0</dd><dt>country</dt><dd>0</dd><dt>store</dt><dd>0</dd><dt>product</dt><dd>0</dd><dt>year</dt><dd>0</dd><dt>month</dt><dd>0</dd><dt>day</dt><dd>0</dd><dt>weekday</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[date] 0\n",
       "\\item[country] 0\n",
       "\\item[store] 0\n",
       "\\item[product] 0\n",
       "\\item[year] 0\n",
       "\\item[month] 0\n",
       "\\item[day] 0\n",
       "\\item[weekday] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "date\n",
       ":   0country\n",
       ":   0store\n",
       ":   0product\n",
       ":   0year\n",
       ":   0month\n",
       ":   0day\n",
       ":   0weekday\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "   date country   store product    year   month     day weekday \n",
       "      0       0       0       0       0       0       0       0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sep('train')\n",
    "number_of_NA_train <- train %>% sapply(is.na) \n",
    "colSums(number_of_NA_train)\n",
    "\n",
    "sep('test')\n",
    "number_of_NA_test <- test %>% sapply(is.na) \n",
    "colSums(number_of_NA_test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "cc5e7b9e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:10.382767Z",
     "iopub.status.busy": "2025-01-03T15:32:10.381138Z",
     "iopub.status.idle": "2025-01-03T15:32:10.426347Z",
     "shell.execute_reply": "2025-01-03T15:32:10.424512Z"
    },
    "papermill": {
     "duration": 0.060126,
     "end_time": "2025-01-03T15:32:10.428903",
     "exception": false,
     "start_time": "2025-01-03T15:32:10.368777",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>date</dt><dd>0</dd><dt>country</dt><dd>0</dd><dt>store</dt><dd>0</dd><dt>product</dt><dd>0</dd><dt>num_sold</dt><dd>3.85</dd><dt>year</dt><dd>0</dd><dt>month</dt><dd>0</dd><dt>day</dt><dd>0</dd><dt>weekday</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[date] 0\n",
       "\\item[country] 0\n",
       "\\item[store] 0\n",
       "\\item[product] 0\n",
       "\\item[num\\textbackslash{}\\_sold] 3.85\n",
       "\\item[year] 0\n",
       "\\item[month] 0\n",
       "\\item[day] 0\n",
       "\\item[weekday] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "date\n",
       ":   0country\n",
       ":   0store\n",
       ":   0product\n",
       ":   0num_sold\n",
       ":   3.85year\n",
       ":   0month\n",
       ":   0day\n",
       ":   0weekday\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "    date  country    store  product num_sold     year    month      day \n",
       "    0.00     0.00     0.00     0.00     3.85     0.00     0.00     0.00 \n",
       " weekday \n",
       "    0.00 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "perc <- 100 * number_of_NA_train %>% apply(2, mean)\n",
    "signif(perc, digits=3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e9de3440",
   "metadata": {
    "papermill": {
     "duration": 0.010623,
     "end_time": "2025-01-03T15:32:10.450104",
     "exception": false,
     "start_time": "2025-01-03T15:32:10.439481",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<h3>Visualization</h3>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "a25ed591",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:10.474774Z",
     "iopub.status.busy": "2025-01-03T15:32:10.473201Z",
     "iopub.status.idle": "2025-01-03T15:32:13.492925Z",
     "shell.execute_reply": "2025-01-03T15:32:13.490049Z"
    },
    "papermill": {
     "duration": 3.035865,
     "end_time": "2025-01-03T15:32:13.496304",
     "exception": false,
     "start_time": "2025-01-03T15:32:10.460439",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2AT9f/H8fddRtNFWyh7b2QoAjJEcYEouAeKAxf6dSCCil/EgeLEjSiOn7i+\nKg4URMWFIqC4RUSGIFtWQWhLZ8bd74+kBdokbdJLEz48H39oSD753Cfv++Ty6uVyp5mmKQAA\nADj46fEeAAAAAKxBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAA\nRRDsaoO3eJVWFVdqncbNWh8/9IK7n357W4kv3kOO3h+Tj/K/oib9Po33WKxkeHY+d/c1vQ9r\nkeZyuFIzT7jl53iPCPHBTAjj++s6+9/+na74LvG7PcS9fVi2v6onf7453mOJIVUnT5jVZ4/L\ngFBZadHe7UV7t2/ZsGDuuw/fMfHBNz+89YxO8R5UYlk8+/3NpV4R6Xb6uZ1TanXqmr68kT06\nvfLn7rI78v7ZWlybA1BMHFdlDSX+TDh4a4uDRaLNsUQbT9xRgkTkKVh921mH57y/6pGz28R7\nLAnkyatHzNxVJCL3b8rvnJJem4te9+7w8s/yjNbderRr3KxLZm0OQDFxXJU1lPgz4eCtLQ4W\niTbHEm08cUewq20nzPxz1sBmFe70eUoL8nb+tfSHt5+f/PKXa0TEND1PDB9w8b/rj0h1xGOY\nOMDvj/zqv9H6nBdXz7zarsV3OIgbZkJ4zjrZjRo1EpHsDCs3XDHqFoeCQ3DyEOxqmz2tTkZG\nRuX762Y3aNG2y6Bzrjrl1r7DHv9RRHylWy5/eNmS+3rU+hhR0aa9bv+NzredwWf5oYyZEF7P\nyQu3TT5ousWh4BCcPPx4IuGcN/nL/hlJ/ttrX30zvoNBgBn4v+7iLXNoYyYASGxsmxKOZku/\nu38j/+3SvAW1ttxdK8L9Ymj37rwS90H8W13EmmkUbt2yeXeBJ3aLCD9FFVYLLzwutY3RnKmF\nqRgXqr6uhKJIkU3EnqdoZXnBB322qcr2P93azd/YkdIpVBufO+e9aQ9fcd7gjm1a1MtItTlc\nGXXrH9aj/4Ujx8344o9Qz1r96rH+no97+2//Pb/Onjq4T7d6qQ5HSmf/Pf4GyXWHmqbp8/z7\nzC2Xdmtex39nUlpW6w5dzr7y1hlfrAi1iKUP9/I3btx3bqix/zj7lTGXn9W1Y5vsjFRHSp2m\nrdofM/SiB6e9ta3UF6bDyo59dXWoYViy6JzfTw+16HYXLohw0VUxSr98+7lrzh/YqW2LOsmO\n9LqNOnU76vKx933y4z/WvijTNL8+q7X/VfS4Z0moTgtzAnuLnWk9Kjy0fvaJ/oeOfn6laZql\ne36/6aJTm6YFjl9xpWa0OOyo4dfd/fWK3RWeWJ1VWeUULc3/3qYFvgSdumVvmLrc0y7ws4Z2\nw78MV79qiHAmRLxGqvPCw7Oktge8hqi2ML+MP8K/iI6Xf7v//VHPmZh262d49rz/woNnDejZ\nslFdhyu9RdvDzrzyttnfB953ybomIq7Mk8L0EEZ0ZbTkdZmmWbJr6XMP3DrwqG5NG2Q5ktKa\ntupw3NlXPf/eN/5ZOKNTPX+H1flUMiPcFOetWfTE3aOP79m1WcN6SUlprToeftKpZ902efqq\nPaXhl2L4Cr+Z+dxVF57erW3zzPQUmzO5XoMmRx1/2tgHXlyxqySK8Ry8kyfq1Uewqw2RBrsv\nTmvpb5za6KqgDX585fb2ZV/XBtV+4LVri72Vn1hhy/7ebSeWP6VysHPv/X1IhyCHA/odceZN\nq4s8lRcRPtjt3fjp+X2bhurTVbfrpBnLQnVYWUTBLopF11qw27N85umHZwddkKbpx102cUNJ\nkLUZ3YsyLQ12uavfODwz+FTUbakjnzxgSxpF+Ag6Rce3CkzLrmN/DDX+0vzF9rL89+iG/FDN\nqqn6MyG6NVLNFx6GVbX1i3oLU50P0YjmTEy7NU1zz4r3T24fZCunafbTxjxbYtTosznqMtb8\ndZmmOX/q2KZJwQ+jb3n8yF/zSmMU7AxfwdNjz02xBf8+0JbU5PqnPjVCLGLPivdO6ZQVail2\nV/M731we6XgO0slTk9XHjycSjmkUPrBou/9289Mvr9xg+UuX9rn6jfJ/arozu0F9l83YszOn\noOzb0jXznu/bP2P7rw+H+a79tydOO/+Rr0VE0xzN27dvWL/r/o8aRsHNAwbOXZ0XWIpmq1O3\nTtHuXE9Z8lv64ZTe3bf++PtbHZKrO4vyVr/dr8eIlYX79nKnZGRnJfl27Mz1mqaIlOz+c+JF\n3dflLH5ldO/yNg36Xj5+/EARmfX0438VeURkwPU3H13HKSKtuoXcBFiy6JQG540f30VEfnr+\nqa9zS0Sk3ZWjz2uQIiL1jmhezUVXadevL/U65rqNJV7/PzXNXrdhQ710z849RSJimsaC1+49\n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\nO53OKhtXn6Zp/s79N6yia7q/29TUVAu7jYWYFlbXLe6Wwuq6LhQ2ZoXVNI3CUljLxaK25Z9Z\nyhTWMIwwj8Y/2BVsnvnkU7/5b2uaY+j1E4f3brh/g90eQ0QcGY7Kz3XUcYiI4d2TCC39Nm7c\n+Npr+37V26dPn7Ztg+ztiyn/G0PTNbvd+vWr67p/62MVTQ/kxeTk5CobxxeFjZGYFlbTLO6W\nwvpR2BgVVkQO2cJKjGurTGF9Pl+YR+Mf7FKbnnb99X09JQVb1q1YuOjXj6fetuSHcx+/Y0SK\nHojYVf7o1DQ9idDSLzk5uWnTpuX/dDqd4VdALJimKSJilt2wiP+PHmv7FAmU2DTN2i9UpGJa\nWLG8thSWwlLY2IhRYSVGm9mDp7BycH1+xa+whmH4E3BQ8Q92SVm9TjklcHvE8B9HjXp4y8/v\n3/PBcY+c18p/Z5ZDFxHvXk/l53ryPSKi2+smQku/vn37fvjhh+X/zMvL27NnT8VnxpjH4xER\nn+ErLi62sNvk5GRN07xer79/q/gMn4h4PJ7aL1SkYlRYl8ul67rX63W73VW3rjYKm5SUZLPZ\nfD5faWlp1a2rjcI6nU673W4YRklJiYXdUliHw+FwOEzTtLbbg6iwEpva2u12/5ewKhU2O7vi\nz0/LJda1YlMa97l5QCMR2fjJF+V3tnXZRaRgXWHl9gXrC0TE7mqdCC0BAADiKw7BzleybvLk\nyZMnT87xBDn6r173TBHxlW4uv6dDu3QRyV0W5BoPW/7IFZG0Vl0ToSUAAEB8xSHY6c4mPy1e\n/N13383PDfL9yN41BSJiS2pZfk+zMzuJSOG2mcXGgd+Om+73txSISIezmidCSwAAgPiKQ7DT\ndNc5jVNF5MsXv6vwkOHZ9cq8rSLS4JgB5XdmtBtR32nzubdOXZyzf+OcH5/dWOKzObKv6JSZ\nCC0BAADiKz7H2A29aYimaTk/Pn3X8x/8vWWPzxTDU7xu2aJHx920vMhjczYae/G+U4To9uzb\nz+8oIt8/dcenSwNf0W5aMvfOxxaKSMdhE8pPehfflgAAAPEVn1/FZh52ycRhmye9+8PSua/e\nPPdVTdPKf4RsT25+zf0PtXEd8DvedsPuH77q+hm/bn/urhtezchONgp27y0Rkca9Lrp/WLvE\naQkAABBHcTvdSY+Lb3/xiIWzPp//28oNe/bkmvbkek1aHtHrmDPOHtw0pdKoNPvwic+3n/vO\n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\nCAWtpAPX9uoNA0Tk6vbv8rg84tyFmyLiGVincG+RTlE8HwzwFJG//sq6riZe+86S+WKIgtYk\n/uKXKdku1ok9scqiqorO86FAT0ctYudtbukIdm6mw7jnfPWKOfHoqPGfRmQ7Y0C1xH899a1I\ns0VRDM+8dOvrIDrNKiLGbIfejn6/qtDDsL9PRe/3fM0AEdnx3v+yPFDl4q8zD97MdJtcZwzV\nXTj8sxeo8u4o45fwnVev3MPdRCTuwspdi3eLSJk2z7jt5bC5MvjUnza8tYhEH145+/fw9OmN\nBzUUkbNrZ524melAkmqJ/3jKx8uXL996o5C/KfKuqttt73pTtcnDWojIhU3v7k3IugV17FlN\nRC5tmnk6MS3j9OTIvz7af11EGj3TxJ538QrqUdqoT43f+93aCyJyb6tbFwoE1OsiIgkX1q8/\nH68oSt/6/z07oaCVdODaXqVfD52ipMTuGL98R47RLvbUD59diBeRe59rWMj3yKB7j8oicvaL\nRXGZvtPUzR/9kqVlQWtiST4/fWOmnXmqJfqTGTtFJKDmc7ZznxyyiJ23uaUj2LkZU3DbD17t\nqChK7InNLz0zctnan46HXYyMjg6/ELb7pzWTXxmy+kCUiDToO6n17buidCrvIyL7ps8/ciVR\nRETU6Ksnl74/auIXx2wNwpLScnyvPBSozwfGDjLqlOQbO195ffae45dTLWr0lbDf1y18bf4u\nD2/vQnerMc747PZX3h1FhCel///Oq+fp/2BTP6NqSVhwIFJEuvSr5pxRu1i5dmOeqhcoIjvm\nTTxy+/dKUJPh7Up7W5IvTHz5rR/3HE9KU0U1Xzuzd8Fbr/wRnaz3rDiyZ+U8e81V3lV1x+29\nXPtx3Sr6qar5QrYnn5bvNLq+j9GSenXCiGnbDp1PU0W1ppz8e/OEER8kWlSvkDbDm+T1xKD/\nKIb+lf1E5KeriYreu9vtE+mMJVpVM3mYE0+eTErz9G9XO8MFBAWtpAPXdlPQw+N71BWRY+s+\nePHNDzZv23P+8tUbsbHRURGnj+3/duXcl8ctNqtqiWo9RjQo6ImJOajYbWyorzE1/t+Rk/93\nPDxeRFJiLn274PWVp1Js92pJT6iFWLv2Lxo3f83vEfHJluTYE//umjV2+O7oZEXnOWhsO1sD\nhyxi521u6TjHzv2Ub/fKHH3g5DlrbiScX7d8wbrlmeYqir5139fGPvnf30Zt3xi8euiH0VF7\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2AT9f/H8fdltOkelMqmyJShCMjQr1tUcCuiOHDhQBBBBRFElJ8DHCgqOL6g\noigOEATFhSKoOL4iAgoIAm2RVVb3SJq73x9pS2mbNGnTXvrh+fhDk9wnd5+7e9/1xeWGZhiG\nAAAAoOGzmN0BAAAABAfBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwA\nAAAUQbCrD8UFm7XqOKJim7Zoc9ZF1zzy4vt7Ct1md7nm1k87xTNHzfp9bnZfgkl37X/lkTt6\nn9Aq2mF3RMWfff//zO7RMY3V4c1Pwzt7NsBOt/wY+qPF+yckeRbs+V/uNLsvdUXh4gnN1Wcz\nuwMoUZSfszc/Z++u1JXLPpw6cfKT737ywKWdzO5UaFm9eOHOomIR6XbJVZ0j67V0DXfWsB6d\n3vzzUOkHWf/uLqjPDlRm4tIwXQiujvKO5VWDehNqZRZq/WnQarkwWfqhyJW7ZdzlJ2Ys3Pz0\nFceb3ZcQ8vztQxccyBeRx9OzO0fG1Oekt384pCxGxLXp1qNd0xZd4uuzA5WZuDRMF4Kro7xj\nedWg3oRamYVafxq0Wi5Mgl19O3vBn4vOa1HhQ7erKDdr/9/rfn7/1WlvfL1VRAzDNX3IGdcf\n3HFSlN2MbuIofzy9xvOizZWvb1lwu00ztzvHOlaHD2GxSU2aNBGRpLhg7jrqaLQ4FlA89Yxg\nV99s0bFxcXGVP09MSm7Vtkv/K2+78IG+g5/7RUTcRbtunrph7f/1qPc+oqL0HKfnRedxlxIj\nTMfq8KHntFV7pjWY0eJYQPHUMy6eCDmDpn19Wly45/W2t941tzMoYZT83+JgkwkBrA4A8ILd\nYsjRrDGPnNbE87ooa2W9TffARl/XKx06lFXobMDX6iIofBeJ2uph3k1ZvIaet3vXzkO5rgYx\nWtOpOl8hhYVcWwbqnit/U9kC7/9FerXtf32gm6exPbKTtzZuZ8ZHs6beMuiCjse3ahQXZbU7\n4hIbn9DjtGuHjZ3/1Xpv39ry1umeMZ/5/j+eT9YsfumCPt0aRdntkZ09n3gaRCReZBiG23Xw\n5ftv7NYy1vNheHRCmw5drrj1gflfbfQ2iXVTe3kaN+27zFvff1n85uibL+/a8fikuCh7ZGzz\nlPb/uei6J2e9t6fI7WOElZ3+1hZv3QjKpDP+uMTbpNtduzLASfuiu/O+W/DKbdde0q1ty/iY\nSGtYRKPkZqecdfGYJ17feKCwfMsAl0Zg8+vhT5GUl7X1++mPjDqrZ9cWxzUKD49O6XjiuQMu\nHzdtzubDRbVcLBUEuDrqY97L83PVBDSJGmzmv40/yTP+jjf/UGHQjsXneAad+uomwzCKDv9x\n73UDmkeXnPbkiIprdcIpQ4Y/8u3GQ/U22jK66/DC1568/IyerZsk2h0xrdqecNmt4xb/9K9n\naIRFExFH/Lk+xuBDzfaWQZkvwzAKD6x75YkHzjulW/PkBHt4dPOUDmdecdurH33nqcL5nRp5\nRujPnwYjwD1AjbfN4O6RGnTx1HL1BVR7Aa1cH2Mm2NWHQIPdVxe39jSOanJblQ1+efOh9qU/\n11ap/Xl3bSsorvzFCn9UPhp3TtlXKgc7Z84fAztUcTqgx0mX3bsl31V5Er6DXU7a51f3be5t\nnI7ErlPmb/A2Qn9q3YcaTLp+gt3hjR9d2CnB24RsjpYPv/tXWWP/l0YN5tfDnyLx0N25L465\nKtJa9YF/a3izu1/4XA/WYgpkddTDvFdWs2DnYxI128z9/COauWXeifFVj9xijRr2fMXv1tFo\nPQ5vXHh++yp2NZpmu3j0zEK9Vn+ba7y3rP18GYax4qUxzcOrPpe99VnD1mQV1VGwq822GfQ9\nUsMtnlquvkBrz//du+8xc/FEyDH0vCe+3+t53fKSmys3+Gv2jX1un1f2VrOEJSU3dlj1w/sz\nckt/Ld26/NW+p8XtXTPVx2/tv0+/+OqnvxURTbO3bN/+uMZdyw/V9dz7zjhv2Zaskqlo1tjE\n2PxDma7S5Lfukxm9u+/+5Y/3OkT4W0VZW97v12PoprwjB9gj45ISwt379mcWG4aIFB76c/J1\n3bdnrH5zVO+yNsl9bx4//jwRWfTic3/nu0TkjLvvOzU2TERSunnd+wRl0pHJg8aP7yIiv776\nwreZhSLS7tZRg5IjRaTRSS39nLRv+Xs/6dljyPbCYs9bTbMmJh8XaSnO2Le/SDdEpLhw5xM3\n9nB03DmxZ2Pxe2nUbH4r81EkevGhcQO6P7f8yG05w6LiG8eHH9q3v6BYFxF30e5Zowf8svG/\n/3ttWFCucPBzddTDvFepBoXqYxLB2syrVFyw5fJ+t6/PLBKRsNiWJ3Y5PtZW9Pf633dlOUVE\n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\ncREhJyNCTv62fc/UhdMDvAryP1ndPGPciiO3FMXe09s1NvrOzbBzW1ct+Dso5pupA0TEvW7j\npm5xl06fNJqtvg2aVLLXVfbN9uZNg3NjnaJYVXXToi1dJz/tos/4h0dnX37SpEn3fs3Txm3s\nq7RiQ35/dcrSWIsa8NTktKnOaopc/O6bv90fneSwEGNYyNnfNm0ZN2/Ow1VdM2wn8q/l4+f8\naFZVvb2DnaLYOLh5EhRvEhG9s1vOu85r4y3JER+OX300JlnRO7kbUoyxMcGBO2ceOz390xdW\nvzXnXGyKnbOHnVjiYq4f3vnDmTNRq5e8mmnQ8qlwd13SSkuyqa4Clla2x3/vMB0qDavkuiws\nNvPZWNUcvSLUqOidn2vgtSzTE6/vX/nagk0JFlVEFJ1eUZNjIsP+jQw7su+3gdO+Gtky482z\nGRpWqucBKbLByvdU4FK5XtOm3teDTt1IsbjXaVTD2c6nmovka6rPawnlysZusfHYi2K2fAAI\ndmVRrVbeEhabeHOfyMNZrnDlp1nbz8Xo7f1HjB/XrU0DN0e5eeXMmo/m7b4Su/6/nz+7ZpqI\nWFOuTX/r0/Aki1eDbhNfHNSkhl9yTOTBHWs+/37PhZ1L5jZr/k5nfxFRzbdnT5ofmmBy9Al4\nccJ/OgbUMlgTg//Z/fWnyy9Gn5o96YuVX090yO//54TItSuuJwb0fXHC0J5+znpL0q0tS2cv\n//VC5OFlv9zu+bi3Y72xb88UmTvs6QN3kh+aODn1LZns6B2qjAnw+er4rZuHV48afahbj65t\nWrZoVKeKIZvW2b5xG/sq3aGF73/jrcXRZmv9vm/MGtE27aKfZrz927kYO+dqI14Z3T6gno9D\n8sWzx374cklg+OXP35xad/XHldK81WBOCJr88f56PYePeaJ7TX8PEbm8aWqug5snUceWnUow\niYh/9wppH8+867w2Pil6+zG924Cx7w3qHuCsl5CDGybNXW1KuTZ97AyDS43xs998pFFlnZq4\na9X7n20Kio/YtTZyzLDyznltf5YKd9clqrQk++oqYGnZov2Iess+/Ofkin9lfrp7Y2POL4+1\nqB41R5bLdP+N1Xzr3YWbEyxq+dYD3xjVr15lb0U13wg9vX7Jx7+dNW795P9Grk53LVsWDSu1\n84AU5WDZMs9nqUrfCTP7yprnB627mVD3xben1fWUfE31+SuhnNnYLTYee767qHhxjV1Z5FrD\n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\nCXMAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nyhDLoq4sfEGDinT2w3RRVzuZoLwlK8/qe9XiPWUi4sxqeVi3dln2sr8W/74p3y0ihq9o0i0D\nGh29+aG+jeMz2b1rP+3T+0L/EhMRzeZq1CSnaEdeYZnPNL1fPHPD4Zv2GhHOY0DsSzLq+bJi\ny63lOmZ4d90xuMeT0/fdMteZXq9hvZRd27aXeA0R8ZVtnjhq8Lxl//fryyMqfwGpeOtnvXoO\nX7Nve7fVb9Q4TffmbdteZpgi4i3d+NC/ero6bxzTq2FEQwovOVee6CsYRYREpCI6Y/fpncf4\nW+r2et/sqnra2VO0tJHT5m+Q1qT/xMmzd5dWfLJjlK2Y++V1J7cN9PXgmvwqbw/8vd7zkXFZ\ndt3uanX3cx9t2bvfqaAqa0ha4yOffPfb7SVe0zQNT+EvX/7vrMP3nT5pfcbLVboIdcbO595y\nasM0/0uannLmzU/9urr8/La7YOOUV+7tlOGseNX18ord1ZfMebnlb39wQ0H4ZVhF7F0/1a78\nRmWn/5EXUdc1imVp16aaMc7+1p/u07TyHa/N2XTk42+u2FpomqZpelfP+/LGIZ2qjL9uz9h5\niv86MrN8bI60dmNenrypsHzutq6cM/ZffQP9HnrDt5XfGPWqUhthVoYY17RaFrRGYWa/Nl3E\nuJOp8eyIs55TROyuNve9Nr3QV37WxvAVTnn6WodevrJltf5PfCZreAvOaZpePoXMLg+99c1O\nt880TdNwL5z+3und9ksGkZ50iWVJxjhfMW65NQq/iU2+dt8fCX2H3z5z4Rr/bBue/J8/f2VI\npaV65sT9Pol+oGJ3Z3e1vvflz/4pcPuf95bu/OZ/D7Zylf9Zm9niqoiGdCCuPLFUkGAXD5WD\n3YlTVhRWU7Bn9+b1f30/9c2rhxzib6ZptmteW1p9Uhu/HVpeaUfD73eWVG9g+Iovaly+qvV5\noeoUArt1TddszkafrKy6Uzb3jxoZLU77s7DqccXwFY4d2jrQ5pFVeyq/GirYLRjbKzBrd3z4\nV/V+izZ/17PisJfV5qbqDaI+WsfedXyCXaRLuzbVNGOZfcNzSv1U//OOtM4frwoy/beu6xVq\n52LGHOy++ldH/0v21A6frdtb/b3vXXdoYHP4p2zfh1mJCnYxrmm1LGiNahPswnQR406mxoOo\niOj27DeXBLluadbdPSsWoKPIt98ndRZNdumzx5evY642n22ouo75yjZd0mHfp2yRHptjWZIx\n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\nIoZ3dzK09CspKdm0aVPgn26322azBZ/huPNvA6JVPIhPd1ZNvbyL5Fm8sVCqNKJUdShN0qI0\nyUyp6hxopUmKYOfes+aD1/7vk1nLDNPMaNnngfG351S6oK3GL52apicZWvq1b9/+xhtvDPyz\nYcOGRUVFNU0jTnw+n4iYhuHxeGpsHDWbzabrummaXq/Xul5MwxARn8+XPIs3FvEpja7r/h2T\npb2IWtWJT2mk4gyH1+s1TQu/aE9pouAvjc/nC3+aJEYqlUY43FjMNM2MjOA/5SAJD3amUTzr\no9cmvT8932fotqwTz7tsxIUDM/b/mkKOQxcR794gK4enwCMiur1+MrT0a9Wq1WWXXRb4Z35+\nfklJSZA5TwT/lmaYpqVbmqZp/i3N0l4M0xQRn8+XPIs3FvEpjd1uj0+wU6k68SmNruuB9ODv\n0SKUJgp2u13TNMPijKJSaSSOG46IHJylSdJgV/zP/McffGrB5mJNcxwx6ILLLj23XXaQ60va\nu+w/5ZcVrgmSlAvXFoqI3dU2GVomv16ff3bc4sWpaamN3n3Tul50Tdd0TUzTZ+Vft5k7dpQU\nlxQedpiccqJ1vcRNfErjz9xSsc+1jkrViVNpRHSbTUQMw7D0jB2liYJNt4kmpmEYlKbW4nS4\n0XVN00zTtPRk6gFXmoQFu73rvh1124vb3b7s9v1uHnV979ZBvp3g16lDpmwr2rNkg0inKi9t\nWrxHRDLaHJoMLZNfk9Wr2i//M9GjqBv1RETk77R4XM8eByqVRtSqDqVJWpQmmalUnQOuNIkJ\ndoYnb+x/Xtru9rU8/sonR53p0sNd9tjizC7y89aiLR+XGCelVm5puj/ZVCginc5qmQwtDxTu\nnPpGj57WTV/TNE3TzIrrEiyi//G7c/cu66afEPEpjdT0jarYqVcdq0sjmqb7S2OaYuVpIUoT\nBU3XNRHTNC09mapeaSQO+zRd00QzxTQNSrNPYoLdxs8fW13iddXr/+ToM101fZklu8OlDZ0/\nbndvfn5O3h3HNg48nzdvwvpSn82Re0WXesnQ8kCxt1MX99MTrZt+fK5mdV5zeYN5c2pud0Cx\nujRx+/KEetWxujSapvlvpeH1eS09RFGaKNgddk00n+EzfBb+RaReaSQOhxu7Tdd0wzR8Xgsv\nLzngSpOYX574euoGEck9us+WdevWBrN+/ZZ9Q7Tn3nV+ZxH55ZkxXy3a6H9yw8Jp9zwxW0Q6\n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\nAAAANOL/ASJkT/14yAEFAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdZ4AT1d7H8f9Mkt1sYyu9rdJBBBERVLBiARsWFPXqVbEhKlixojw27IhiuTau\nXVEQFRuKoKJybYD0DtLrLsu2bDLPi8mGLdlskpndZA/fzwvIJmfOnJycM/llZjLRDMMQAAAA\nNHx6rBsAAAAAexDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR\nBLv6UFa0VKuNO6VR81YHHTf4gvuefW9zsTfWTY7egvFHmM+oRb8vYt0WO/k821+47+o+Xdqk\nul3ulIzjb/lfrFsUX07PTjZf94c27K2L+t/rkmPWf/JXG+qi/vrEWKrJz9d1NV/lzpf/FP/V\nHuBUmpIhNMTB44x1A+BXUrh3S+HeLRvXzp7xwaN3j3347U9uPbNzrBsVX+ZO+2hDSZmIdD/j\n3K7J9Tp0DW/e8F6dX/97V/kdef9sKqrPBkAZcT6WYjjLcICIwzEWh02yosE/ASV5Cpbffvah\n2z5a+tiQg2Pdljjy9FWXTtlRKCIPrs/vmpxWn6te/cGwwDtx+kHde7Vv3qpbRn02AMqI87EU\nw1mGA0QcjrE4bJIVBLv6dvyUv6ee1KrKnV5PSUHe9mXzf3nvxfGvfbNCRAzD89SwARfvXNMj\nxRWLZqKSvx773bxx0DkvL59ylVOLbXPQgDGWQkholNOsWTMRyUm3c7tXR9XiQNAQBw/Brr45\nUxulp6dXvz8rp0mbdt0GnnPlqbf2HfrkryLiLdn470cX/vl/veq9jahq/d5S80bX28/knRhW\nMJZCOHz8nM3jG0y1OBA0xMHDlyfiznnjvzk6PdG8veqNt2PbGPgZ/v91N1MG1jCWANQltixx\nR3Ok3Xd0M/N2Sd7selvvjsWhvvKza1decWkD/q4ucMAKPbUbyiqqM3z7Nm3csKvA0yCqjQcK\nP7U4ESc9TLCLR5ldG5k3DO++msr4PNunvDD+ivNP7dyubU5GqjMhKSO7SdfDjxl21e3vfbOw\npqVWTB5gfnP7uPdXmff88clzp/Y9NCc1ocURV5v3mAWSs08XEV/ZrudvvfTQNunZ2RlJiU53\nWtbBnQ4558rb3vtmiYXn55v3yRujLx/SvXO7xhmpCSnprQ7q2P/0ix954d0tpb7qpQPXTzFP\nbhWRe9o0Mu8ZMHlFna56+/wzzRXdvHqPec+nPZuY93QYNifCVVf18QmtzKrSc+8JWmBUq0aB\nq+GMXZtfvcCO+VcECry3veo3K/NX/vj02JuO7929dbMctzvtoM49Tho05I7HXlu2pzSc5llc\nvIrinT/1b+y/HkpKsxN+2V1SvUzJzgUvPnzbwD6HtmqaleBOa3VQp+POGf7SlNlBXphqIpoO\npXt/ceq62ZjnNhWEqPaBDpn+l/uimRE822AiHEuRDVQJb2qHEM4si3QVUWyjfr+zZ9BLS6z9\n5ETz/qNfWioipXvmj7p4UOv0zJat2mSnJSSlZrTt2ueiEWNnLdldn9UGGGV7Pn75kSHH9s5t\nnp2Q1Kht+65nX3nHJ79sNB9NduiapiVlnhS6kppEt6m35alZmZLVRbolj3oTZPgKZ3/04vBh\nZx7avk1moxRnYnJO05Z9jj/j5of/s2RnpS1POE1qkIPHQN3zFO6PQQO/XF9r+a9Pb2sWTml2\nZdACv75+Z4fyw7VBdTjp2lVFZdUXXP5Gf7PAse+tNAzjw9tPCCziSu5qljH/TMoaXLr3r0Ed\ng5wOaOpx1k3LCz3VVzH/0d5mgeZ9Z1R/dO+6L87v27KmOt1Zh4x7d2FNFVbX/43ltXamlVVv\n++uMmsq3v3B2+KsOauOsc82qdEfq1lJvlUe9pZuT9P1nYB3+4F/Va/jxik7mo4kZx1a83+ct\neHb0ucmO4B/bHIktRjzzha/mhkW3+OCsJLPAg+vzqzxUvPvXE5olm48m5fT/YXtR9ZXOmji6\nZWLwU37bHjf897ySdztnm39Wn0FRTIcxuf6BfcjoX2vqh5L8uU7N/xI8vrbqk4pU+GMpioFq\nhDe1QwhnlkW0iui2Ub+N6WE+2unfP1a8f800/7qOenHJnuVvHZoRvGbdkTL86R+NauqoWtPu\nxR+d3CHIdlLTnKePer7YZ5gT2Z1xYq2vQnVRb+qtPzUrUzKo8LfkVrZguxd/eGrnzJpW5HS3\nvuftRRE1qSEOHoJdfYgo2Pm8BceWz+TOV/1QvcDf/7mk0gjQExo3a9m6ZfPUBEfF+xv3uqNq\nWKi8af79ycHlY8jVpmPXI44eapYx70zMOHbkYTkVxpkjPTvTpVU62Tuj4/nLqmW7EMFuz7J3\nu1T+km9yek7LJpnOCtVqmuPfEyq9127+/rkxY8aMGTOmU7J/2QEjbjbvefH37bV0vbVVF2ya\nbK7ohAy3Wab9FTea9zz+7uowV10Tz76FgbWPXraryqO7V9xSqavbj69ewzXNU81HDz73m8Cd\nXs/OW05qXXHZhJSMli2bJjkrbSUPv/o/QbeMUS9eU7Arzf/ztFb+drqz+n63pbD6Sj+/b7BU\n5m6UneLav8b09hc+frD/miBVZlB002HpK/6JkJR9VrBuMAzDWPLCMf4yWYNrKhO+MMdSdAPV\nCG9qhxDOLAt/FVFvo2p9E+3z9CfHZftHWkKj1r37HXtC/74t0xMqdI5+19wtRr1UaxhG/uqP\nAj0mIprD3bRl89TE/U+z0/mPJkYb7Kxs6i0+NStTsiZhbsmtbMH2bZ52sHt/GNU0R3bTFq2b\nN0ms8CFZ0xMf/G1b+E1qiIOHYFcfIgp2H485yiypOzO+2lVctap9i5qUz+rkZv0nTZ2zu7h8\nUvtKlv7y+XUnHxRY14Or86osHtg093pkXCOn7nS3uevZDzfvrRTOqszn5KZHPPnO19uLygzD\n8HkKfv78v2f32B/42p75UpVV1BTsvKWbT22cHJhaZ9301P9W+tNMaf6GaS/f2zE1ofxR90tL\nd1fvmfNy/ItX3ycUmvVVP1W+CTvjr20RrTq0G1r6L5h0yKiq79O/39Oz4qvgcDUu8FbajpUV\nrXaVb62G/7G/VVOvPSSwVL9ht33352pzfPg8eT99+vKgbvs/y541aUH1JkW9eNBg59m36Kxc\n/3NMzOj99aZ91de45cf7tPLU4khoPvLxyUu3FJhPceWvn98wqGOVAVlxBkU9HUryfnCUr/TN\nrUFaZRjGiBb+PHrY2D+CFohOiLFkZaCGM7XDEWKWhbkKK9uoWt9EEzISRMTpzr3vtZmBGeHz\nFkx7+trAdGjU9o4qTaqjan1l+ec0T/HXkNb5oTe/2mnueveV/jnz3TO6VdpvFOl7s8VNvZWn\nZmVKhiP0ltzKFuyB8vcmp7vtvS998k9+qXl/WfHOr/77YJvyzJfW6qrwm9QQBw/Brj5UDHYn\nTFtaUE3+nt2b1i2bNX3y1YO6mMU0zXHNa4uqV7Xha/8HKYer8aydQQ5p+byFFzX1D5e+z1Wt\nIbBp1nTNkdDko+VVNwdG5WCX2ur0vwuqbrh93oKxg9sGyjyyYk/FR2sKdr+PPTzw1G7/YFn1\n9e7b9E2v8vetRrk3Vi8QdbCzvuo6Cna/3dWjfENzc5WHHjk4w2zwUY38u28frvysdyzwn9Wk\n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\nYd7uOHxs4P5Gnf1HtYp2fLyyOMhnNcNbMHH4kW9vDXXYPnyGr3TksZctL6q2Il/x4xcd/d1u\n/06Fy169pGqBajRH2qvlF1Jf8cbQez5ZXb1M4Zbvzjxrknm7UZsRt+Q2qqm2iK6VYO+q68gJ\n5b8t9s2NN5s3Ot5Q6XS0rG53mlfT3bX0wec2FYiIO/PkIdlVv71/90v+vT6Lnht807t/B1mT\nUfrUpcfOLygVEac794WBrWxcvCb97v/ypPLjOy+ec9E2jy/wUHb3hwaXP4vnzz51+togG7If\nn7nw9jmbq99v13TocPk95o3dy+67cbb/nfLOMd1DL2W7eBuo0V2RpJ63UTGku5q8daP/V02/\nG3XG15urHpf0ebbeMPAmX0PrRitTMlLVx5iVTVC7y/yXa85f99Bn1V4O04yx/zVvJOcMdQVL\ndlFfiCcidTp4srs/xC9P1IdafyvWtGPrxnnfTrv90uMDF8R3JXep+Ft4nn0LU8pPi2xx3A1/\nbi7cvw5fyR8zXhvSo9KXHZof82qVlgSuHZ/TdWpNra0ySlJaHj1xyvd55k+0+Ip//+a9oX32\nf1WwxfFVf52ipt+KLStef0L59kLTk86/beL8wI+K7tv06atjO5efmKU5kl5astuoJnBx8EHT\n1tTe6bauuq5+eaJc8e6ZVbr9xc1Vf1l1WJNKVwpsf+F3QSrylY46zH+qlqZpx11x/3d/bfA/\n5C1eOvv9f5+UG6hh0NPzbVy8+m/FVrR5zu2BBXvd/n3Fh7bMHRv45Rynu/Xop99ZuaPYfGjT\n33Puu7S/+WhKG/9PGAUuc299OgRc3iylYsnU5lfXVNK6EGPJykANZ2qHI8QsC2cVFl+UWq/y\nn9l+UojGB05Bi/SXJ6Kr1luy+fTy33FPzDj0ifdn5ZeZP8JT9vfsD8xnmnqwP6IlZZ8RYhVV\nWB/bVp5a1FMyTKG25BY2QcW7v00t77SEtK7jXp62fldx+YPedfNn3f2v/RecO/XFJWE2qcEN\nHsMwCHb1IdKfFDPpzkaPzd1apaqvb+wVKKDpiV0OP/rU00479ug+Lcu3+IkZPR+deGxgYvQ6\n7fwRN+zPXhEFuzE37z+DR3Mk5jRtnOSstIs3LXfw/IKqvyxUU7AzDGPXoskdkvd/f1vT9IzG\nLXJbNkmscEawpjmHP/9b0Ibd2iot0DMDTj7ttFNOGj59XZgvgcVV13WwMwzjnJz9uc2Z2Kak\n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\njcUT/JqULSJuV05UeOjFnyrzQGYlxpe0/V+fiEiH/k8dWvivLJd78cN3jL1zVxv773vpgty9\nnh8iOze40LRNukbJxmNl23NSdsx558O1X337894DR05nXby2oOi/9Ix4ctWZvJ9fniXDir5y\n98Ibe0TEETOkfwP7xTcHYCKO2AFQ2XUvXC0ihXmHZh7PFpGly5JFpPn9d4tIUNTgOLtNRL5+\nc7+IHPnsAxHRNMs/usQUb36ywF3BJyrMLKzE+FISHnvn+w+nrP57vIgU5O7r+eCikr2aXnSO\nqlbetU48/Ov7l23c8tbjMZdcPXLCtDUbvzt6tqB5645d77hnyIhnXp+9cMsPC8uOF5HnH24p\nItnH3lqfni8i2Uemf3I6T0TiJ46q4AsEYA5zv+IHANWqIOdnm6aJSMLUXS7nSbtFF5GR+4vO\njZgX31BEHDF/NQxjdvtIEXHEDC25+by4cBHxr3dNBZ/uj443Spw80e7x9zznSrgLzt4eGSgi\nmqa/9MPv5586s3Z4Rl7yf19eaLatf23rGVN88kTavlc9F72zN7z29UXrU3PPu/5c3tnPPOO7\nrkku2Z5z4gNP+7Uz9hiG8fVDcSKiW4J25RRU/KUBqHkcsQOgMqu97fDGDhE5OHNNZtIruS63\nbrH/rUWIp/e60W1EJOfE7MN5eZMOpotI7MMPl9y81W3RIuLM3pGc7yo9tYfhzMnJycnJcRqV\nGV9Swsi7PXtkzRo2d/XfNU0zDPeEbg9nuoqG2hxXxgf7icjxr1+/0IHBJStSSrVse3K6yzA0\nTf/3zv+MuO+m+oGW87rd5Rw4FBF7w0G9I+0ismvyHDHyn1x8WEQiL5/Szs4XeIBajWAHQHED\nhrQSkYzEyd/NXiciQdFDo2xFu77om4aKiOF2jt3wUuK5QhEZNKRVyW3jhvUSEcNdMGhG+bfY\nWvt4R4fD4XA4vsnIr8T4C6l/1fNz7mwmIrknV9w+6fd7hY27KUZE8s6sHL7mSNmtzv78xpSU\n0l/dS/w1S0QsfjF3lffduFPbP7pQDc8OjROR7CNvLNv81I/ZThHpOb3XRWoGUCuYfcgQAKpX\n9rE3Pbu7JgFWEWk7fGvJ3quC/UTE3tguIn6ODmXuk+Ue3DRYRHSLfdzH35fq271oTKBFE5HI\njv+s7PgL3lLMmf3jpYFWEdGtoZ+mFl2HL/vou55Plq2Bl76//XjJ8ZmH1l0b/vuNIoo/iv3P\n7c08LbMPppeq5+Ca6cXXNL7ls9IXxstNLfr6nT0qUERs9rjMQq5fB9R23FIMgPLcVwYHfp/t\n9Dx4Ys+ZNy8LL+5b/udG92woOo206W0rk9b0LLVx1uFFLeL6nylwiUjcn+95oOeNzaNCMo6n\nbPl84aKvdhuGYfVvuiJxb/coeyXHl3dLMY+D8+5tNWiJiNS/cmzqjqL8t3ZUQrd//VdENN3W\n5Z6Hul9/eajNuX/HV+/OW5lW6I696+5fVnwiJW4pdvbnCRHtx4uILSjuyedHdu7QKjzAOP7r\nrs+Xfjj38++tQa0Kcg4YhhF9w5jP3h7c8JJLSl48r1/DoH+n5np+ju33n4Pzb6nS/wcANcDc\nXAkANWDVbzds0HT/5PPvXp+0+vbi/WH/rSfK3Tx123vtwwPK3YUGxXRa8NOZqoy/0BE7wzAM\nwzX8twz64LLDRW3ugtlDb9LLOzG2ba/nTh0vuitayVuKLR51Y9nBIhJ9Vd8tqXn3lfiI9oF9\n59X248Qri7teT86s6HIDMA/BDoD6Tmzt70knwY2Gleo6l/aFp0u3BCWdK/NJ7G9c+cfnvjKm\nxw0doiNDbRZbSETUVTf2fH76opPO0nf9+qPjLxrsjOwji4IsuojYgtofyP39jNSkTYuG9e8R\n2zQ6yM9aLyK6w5/veeWDrwzDyEldUDbYGYaxa9XsB7pf3zgyxGbxi2jYuHOP/v9auNFTyunv\n53Rp08xutYU0aDY+KaPkVrmnl3lms0f2vtDKAKhV+CgWAFC+7CNvBjcZJiIJU3Zte6qd2eUA\n8I6zYgEA5dv09Osiomm21x5t5XUwgNqAYAcAKIcrP+WxFUkiEtZ6Qud6fmaXA6BCuNQkAOB3\nrvyTuRJhyzs+a8RtSecKRaT3zEFmFwWgoviOHQDgdye39Yjq9Fnxw+Am/dKS51susgGA2oSP\nYgEA5QtpecvSbbNJdUAdwhE7AMDvCvMOL/5gxS9nCy9pm3DvXTf4lXO9PAC1F8EOAABAEXwU\nCwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAo4v8B/P9G\nn93yZakAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot_categorical <- function(train_df, test_df, feat, stat = 'count' ){\n",
    "    feat_plot <- ggplot() +\n",
    "                    geom_bar(data = train_df, aes(x = .data[[feat]]), stat = stat, width = 0.5, position = 'identity', alpha = .5, fill = 'lightblue', color = 'lightblue4') + \n",
    "                    geom_bar(data = test_df, aes(x = .data[[feat]]), stat = stat, width = 0.5, position = 'identity', alpha = .5, fill = 'pink', color = 'red') + \n",
    "                    labs(x = feat, y = stat, title = paste('Barplot of ', feat, ' for training and testing datasets', collapse = '')) + \n",
    "                    #scale_color_manual(name = 'Datasets', breaks = c('Train', 'Test'), values = c('Train' = 'lightblue4', 'Test' = 'pink' )) +\n",
    "                    theme(plot.title = element_text(size = 22), axis.text.x = element_text(size = 15), axis.text.y = element_text(size = 15),\n",
    "                         axis.title = element_text(size = 18))\n",
    "    \n",
    "    print(feat_plot)\n",
    "}\n",
    "for(feat in LOW_CARD_FEATS){\n",
    "plot_categorical(train, test, feat, stat = 'count')\n",
    "    }"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "fdc9ddcb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:13.529267Z",
     "iopub.status.busy": "2025-01-03T15:32:13.527634Z",
     "iopub.status.idle": "2025-01-03T15:32:14.177883Z",
     "shell.execute_reply": "2025-01-03T15:32:14.175892Z"
    },
    "papermill": {
     "duration": 0.669143,
     "end_time": "2025-01-03T15:32:14.180340",
     "exception": false,
     "start_time": "2025-01-03T15:32:13.511197",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n/lozjmp1kTTni0v8NT9DRbJiE11jv7Lnvzv9jtc8lZOfWR+/+kRD2O0rRhu68K7z9Rc1u16f\nsqTVoykvXvp4m7OKLjl27OTtWEIV0146wr00dlshwjmH3RtY7IOv7mIXQmhe56XTWr1Bnde1\n67RxV0+ePHny5MnviKBOpWhaJYKdPHpf2kt/UVn04Ic7/P/48vG9/9JfpOWMs7SyNze7wFtR\nM+Y03qF706vj7vr35paT1O5ceuZZs/XXmd2vv6UgU39tsuTNvbHhoXhLJ5/xaYtaeV27/jb6\nJm8EF6tn9s/TXzh2v/9bnZ9vV5qn+tmJR72xK9DpI4aIZMUmuIw+Dfdn2rFiyiaHn43y9uSR\nX1bUx7dSkQq7fcVoQ3cofPC0xnv4zTr71EVb/XzufvX0hbev2NHmrKIrAXfsMG6HkbwdS6hi\n2ktHuJdGcSs02wcinHMkn7Z3vthwSHvtc6fdNM/fHc0055MTjvu52imEMNsKnh/t/2z4ZkvU\ntEo8UixOfI8UGzS5+TNPWvPd5IbGFuQjxer2fm5XG5K6NWPA9H8sLN5T1zjSU/TzF3desu/+\nRqe+sL7ZPH0PKhm7cEuzUe664hMaG6diSr3gtmd/bnyYiatm+wdz7u2f2fhIbzX1xfX7PdLb\nU7/j9MZblqe0O+Txt79ofPSn+3/L3znn0A5CCHuvhjaW2uGMZm/te/JPzoAFfteSq2ZNeuNS\ndx71t9U7aveN89b/+PHL+lv45B87p9kcfI/iye4z2+9b1Ffuu6ypzt/TYzRNm9ip4ZTYizb8\n6b+EP5GsWF0cHinW2mrR+U5J+bHJg492r7nJt8Zyh162cvO+R9/U7vzl3glHNN0iAR4pFv8t\nEkAk7SvCDe3/WbGatnPlvb4HPZlt3aY89eZvuxuqtP1/K+6ZMEIfm969oQHG7VmxES5vm60+\nSAH6tDh0LG0+UiyMlhXMI8XCmG2EvXRgkeylkW+F1vaBCOcc0aet1zl5cMN5qIqijLrivqU/\nlTROWrdh+duXnVTgm3bsUz8HuURNq0Swi5M4BDtN076YOrLpvqgopg4du/Tq2SNn/1urdx51\nS32Lj8NbuzYcZTGZM0eePGbMKSdNXFTkG7tn7Wt9mzzuVlFM7XI7F3TJS2lyqqmimCfO+r7l\nglRuebdfk2nVlIyuPbq3b3wEuK39yK9+vlJ/nd7p8mbTBtPFf3rjvufnKKaUgw8/5tQxY447\n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\nt9xWtOvxtZki0iH1KteSRjWb58X0METk2DfPvbA1N7zdJUsm9ainzBt9RQdiV165iET1ibIV\n/v7OW2u/3b7neEFpUGRs1979UsdPGdAlpqqy+XcgwS7gnbA7RcQYZay9yhhpFBFnRYGvx4TA\nl7d7w2OPvnjY5giOH3D/lMq/IxvVbJ4X08OwFe9a+ORGnSF6ziPTjPXe2cEbfUUH4qjNISIV\n1u9vm/b2MZvDtdBWcOynrz7++evPh0975I4x3V0Lm38HEuwCXoOXyqiq3RfjgFbYCg+++8rL\na7/c41TV8PaDHlw2L+av0z4a1WyeF9PDLZ1a8dq9j+bZHUNmLk2OqnmGU83aBt+s8X1FB8J1\n2enBN/5jDOt0w4xrB/Tu0iZSfyTr4MY1L324NXvjynva9nljYlKEBEIHEuwCXoxRJyIVxW7+\n1+1mu4joDLG+HhMCk+os+/L9V1a9s6HI4dTpIy+aeP20KSPCq53M26hm87yYHm7h9r2/6H+H\nimN6XT1/ZLsGi73RV3QgjIoiIoo+YsHzy5JjK58z0bFb36kLntHNvO6DrOK05Z9OXDFRAqED\nuXgi4J0ZbBCRkoOltVeVZJSIiCG4k6/HhABU9ue2JTOmPvnWZ2an/tyRVz752iuzrh4ZfvIl\nWo1qNs+L6eGWzFa05b63f9UHtb9/0URP7q7vjb6iAxFrUEQkpvuMqlRXSdGPva2PiJQcec91\nL7nm34HM2AW8bl0i5Fhp4a4skZpXNR7eWSgi4Um9/TEuBJLiQ5/NmvtCns0RdeaQO2fNSO7o\n5hxeaWSzeV5MD7dkttJfbE5VrNlzJo2vvTbnqwWXfyUiMmnlO9e0DhXv9BUdiHOigr4ssoZ1\niq+9Kii+o8i3qrO8yKHGGpTm34HM2AW8dmN7iEhpzhqL8+TD9Kpt7eESEek2rr1fBoZA4bTn\nLrr7xTybo33K1JefmF9XqpNGNpvnxfQwPOeNvqID0WVEgoiY9x6qvars8B8iojcluGb1mn8H\nEuwCXlSX61qZ9A7bkWe/za2+PPf75zPLHXpj/I09ov01NgSE7PTlBywVwdHDnpg9NlhX39Gw\nRjWb58X0cEsW3vaOde4sbB8pIonDHnF96ZquE+/0FR2ItqOuD9Yp5oyXNh4+6Xio6ix789ld\nIhLb53rXkubfgQS7gKczxC+4oruIfPfUvR/vyHYtzPp5/X2PbxGR7pMWtjLyv4z6fLIuS0Ti\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot_numeric <- function(train_df,  feat){\n",
    "    feat_plot <- ggplot() +\n",
    "                    geom_histogram(data = train_df, aes(x = .data[[feat]]), alpha = .5, na.rm = TRUE, bins = 50, fill = 'lightblue', color = 'lightblue4') + \n",
    "                    labs(x = feat, y = 'count', title = paste('Histogram of ', feat, ' for training datasets', collapse = '')) + \n",
    "                    theme(plot.title = element_text(size = 22), axis.text.x = element_text(size = 15), axis.text.y = element_text(size = 15),\n",
    "                         axis.title = element_text(size = 18))\n",
    "    \n",
    "    print(feat_plot)\n",
    "}\n",
    "plot_numeric(train, target)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2be70592",
   "metadata": {
    "papermill": {
     "duration": 0.015868,
     "end_time": "2025-01-03T15:32:14.212112",
     "exception": false,
     "start_time": "2025-01-03T15:32:14.196244",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<h3>Total num sold</h3>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "970a0c0c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:14.248540Z",
     "iopub.status.busy": "2025-01-03T15:32:14.246894Z",
     "iopub.status.idle": "2025-01-03T15:32:14.684273Z",
     "shell.execute_reply": "2025-01-03T15:32:14.681846Z"
    },
    "papermill": {
     "duration": 0.460326,
     "end_time": "2025-01-03T15:32:14.687523",
     "exception": false,
     "start_time": "2025-01-03T15:32:14.227197",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>date</th><th scope=col>num_sold</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>2010-01-01</td><td>85566</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2010-01-02</td><td>82548</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>2010-01-03</td><td>88328</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2010-01-04</td><td>68075</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2010-01-05</td><td>65713</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>2010-01-06</td><td>63699</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>2010-01-07</td><td>61355</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>2010-01-08</td><td>63449</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>2010-01-09</td><td>65956</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>2010-01-10</td><td>72294</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & date & num\\_sold\\\\\n",
       "  & <date> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 2010-01-01 & 85566\\\\\n",
       "\t2 & 2010-01-02 & 82548\\\\\n",
       "\t3 & 2010-01-03 & 88328\\\\\n",
       "\t4 & 2010-01-04 & 68075\\\\\n",
       "\t5 & 2010-01-05 & 65713\\\\\n",
       "\t6 & 2010-01-06 & 63699\\\\\n",
       "\t7 & 2010-01-07 & 61355\\\\\n",
       "\t8 & 2010-01-08 & 63449\\\\\n",
       "\t9 & 2010-01-09 & 65956\\\\\n",
       "\t10 & 2010-01-10 & 72294\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 2\n",
       "\n",
       "| <!--/--> | date &lt;date&gt; | num_sold &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 2010-01-01 | 85566 |\n",
       "| 2 | 2010-01-02 | 82548 |\n",
       "| 3 | 2010-01-03 | 88328 |\n",
       "| 4 | 2010-01-04 | 68075 |\n",
       "| 5 | 2010-01-05 | 65713 |\n",
       "| 6 | 2010-01-06 | 63699 |\n",
       "| 7 | 2010-01-07 | 61355 |\n",
       "| 8 | 2010-01-08 | 63449 |\n",
       "| 9 | 2010-01-09 | 65956 |\n",
       "| 10 | 2010-01-10 | 72294 |\n",
       "\n"
      ],
      "text/plain": [
       "   date       num_sold\n",
       "1  2010-01-01 85566   \n",
       "2  2010-01-02 82548   \n",
       "3  2010-01-03 88328   \n",
       "4  2010-01-04 68075   \n",
       "5  2010-01-05 65713   \n",
       "6  2010-01-06 63699   \n",
       "7  2010-01-07 61355   \n",
       "8  2010-01-08 63449   \n",
       "9  2010-01-09 65956   \n",
       "10 2010-01-10 72294   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum_not_nan <- function(x){\n",
    "    return(sum(x, na.rm=TRUE))\n",
    "}\n",
    "total_num_sold <- aggregate(train['num_sold'], by=train['date'], sum_not_nan) \n",
    "head(total_num_sold, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "245b0934",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:14.721689Z",
     "iopub.status.busy": "2025-01-03T15:32:14.720073Z",
     "iopub.status.idle": "2025-01-03T15:32:15.194479Z",
     "shell.execute_reply": "2025-01-03T15:32:15.191787Z"
    },
    "papermill": {
     "duration": 0.497679,
     "end_time": "2025-01-03T15:32:15.200574",
     "exception": false,
     "start_time": "2025-01-03T15:32:14.702895",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAABwgAAAPACAIAAACuBbobAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdeWBcVb0H8DszmSRN06QbtLQFylL2TVllB1kURJBFUKGAylMQEYTnAgo8QB8i\nIj4QcUNcARVRQBZZhIIgO7KVUijK0lKgpUvSbLO8P5JOpmkyM2nSzJnm8/kDbu89uXPuzG9m\ncr85595YNpuNAAAAAACGk3i5OwAAAAAAMNQEowAAAADAsCMYBQAAAACGHcEoAAAAADDsCEYB\nAAAAgGFHMAoAAAAADDuCUQAAAABg2BGMAhUke/913/vYfjtPHNeYrKpuGDfpuOvnlLtLAAAA\nQEUSjPZPquXF2OD58P1zy31Aq6IuEe/s/+gNvl3uvlSquz+8fq4MnmruKHd3KkXme8dss/cn\nz/rzPY/OX7gkle5YunDe7Pkt5e7VgHg3rfH+vOVauTd7W7bcvQEAACCPYBSoDHN+//Gzbniu\n3L0AAAAA1hBV5e4Ag6Cj+V/X/Oafnctr7/rxj209prz9gdXhsjPuzC2vu8dx533u0A0mja6d\nul4ZuwQh8BUAAACwagSj/RNPjDrmmGMKNFg2776b73+rc7l65DaHH7JFgcbbrj1iUHrVtuju\nz3/+rM7lnS/f3Vkxa55spuWnbzV3Ltc07vnMvb8cXRUrb5cgEL4CAAAAVo1gtH/i1ZOvu+66\nAg1ev/OAXDA6Yq2jr7vu7CHpF6zh0q1z2jNdF2gcs+mZUlEAAABggFxjFKgA2Wx7bnnEpFFl\n7AkAAACwZhCMAgAAAADDjmAUAAAAABh2BKOhaF/08h9/dun0j+6z9WYbrzW6vnrk6HU33HSn\nPQ7+yrevevD5dwb3sf792J2XX/iVj+23y6YbrT9+dH1Vde3ocWtP3ex9Bx85/aIfXvfSu22D\n+3AlSre99eeffee4w/bbZL0J1TV1a02csst+H/vqJdfOWdJRlv50WvrvR7/7lf/ae/stxtZV\nj6gfPW2bnU8849uPvN68YqvsI7f++kvHfWTTqevU1dYka+snTN7wg4cee9nv7m3N9OOxXn/q\n7m+dMX37LTdqrB9RVVM/eeq0nfc85JxLf/7Ua83FfzivMy/849aLvnzirjtsu/6ktWqTNWPG\nT9xyp30+86Xzb3vklf7sp1Nmxm8v3n+3968zZsS49ba/7p2W/u+hy1BWeIkWzHrw0m+cfuh+\nu0ydsk7jyNrqEaMmTFp3x70/curXvvPgrAUl7mQI302D8MoOyiH3s9epR2/+6cnTj9hx8/Vq\n6xrX22iz3fY78ltXXT97Yb+emUCrOorST9z1+6+edOT2W2+2zriG6pGjp07bcq+Dj/vBr297\nqy3drx0N7cfy4D6fAAAAFSvLoHrtjv1zz23j1G+V8iOZdNP1l3xhSm2fN8KKxRJ7HnvOU++0\nFHisXn36pYU9fuS95/9yzG5TC/9UIjnuhHOvbc/02eER8Vi/DnBluzXUdO5hq9Mf6Vwz88YL\nNxtT02t/qmrXO/c3T/W6n7YlD+WabXzM/YUfdPG/z8k13uPal4r2Kt3+zsUn7p2M93KTn6qa\ndS++eVbnT7W88/gpB27c15O59o7HPrWkfeXHuutD6+XaPNnUnm5/53v/tXdfO4lXNXzq7J+8\n25Eu+sS+N/OO4/ea2td+oiiatu/xt7+0uK8f33B5Ee5w8b+y2Wy6450z9l43/8e/8PJ7Rfuw\nslWu8Gw22zT3ygKHE0XRzpc/twpdal3w9FmHvz8W6/MOTrFYbLfp//Pv1lSBnQzlu2mAr+xg\nHXJhuaoeufaxnWte+/uPdtt4dK8PV1Uz+Yz/u6XAMzNYx76aqjqbzS589tZjdpnUV69GjN/+\nqjtnZ7PZm7YYn1vZ2tvxrnIhrcJXwMCfTwAAgDWJYHSQ9TcYTbe/89/7r1vgHDWnZvT2N7+y\npK/HKuWs+PXbLhpTVeoY4c2PvryvPg96MPqXi45J9J3XRFEUiyVO/8OrK+9n9QWj7U3PHLr5\nmEJditf88NmFLe88sNu42sLP5NitP9exUhqSH4w+seidz203rvBOoiiasOsX5rUVykb//dcL\nG0p4fRPVEy/485xe95AfIWXSTWfsuU6Pn12FCGkgFZ5dPcFo0xt/22lMkVet09itT+jrOR/K\nd9PAX9lBOeSiegSjd3zn+Jre/q6wwjPzie8VzkbDrOpsNvvmvd8bl0wU7lUsFp9+5aOFg9GB\nFNIqBKMDfz4BAADWJH2O4WJIZM774DbffWBe7t+J6vH7HHboDpttMLYm9ebrL999803Pz+2a\nRt226Ikjttnp/rn/+kBD9So8Utvi+3f92PnvpbqmdsdisQ2232+/3bZff51xtfH04gXznn/y\noTvvfaIp3dVg5g2nn/LZI6/ab/LADrC4Wb86/tBvXB9FUcNGHzhx+tEf2GqjcSNj8+Y8f/sf\n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\nqmnYrcemuz60Xo+nOlEz6exfzEiv2OyNR64/YKOGXJt4ov76N5pWfqDX7zgzf1fbHv6VZ99u\n6dFm2dxHT92v+0Gratd7eElbjzYbLs8x6yedWuC4SjdYFZ7NZtubnsy12eCwe1e5S9PXqc/t\np27Crr+eMXvlNotfvm/6Dt13f2qYusKzMZTvpkF5ZQd+yCXqpaqTa535o7s6VnyG5j1540Gb\nrZC6fvW+uavp2LOroaoz6eZPLL9MRBRF8aqGky7+Y1N6hYNc/Mq9n9ix6/mMxWK5xq15rQax\nkIp+BWQH7/kEAABYk8SylTM8sCK8fucB633ors7lxqnfWvTq2QWbZ76266TvPNx9++aqERMP\nOOJjO2w6dUxN6s3XZt/15xv/9cbS3NbqUVs/NPeJ7euTPfbSPO9H9ZO6rnyXrNv0+z//7jZT\nRrc3Laje9aA9GqqjKJp73xcn73Nlrn3jtD1P/szRH9h2k9EjYgvffnvmEw/89abr//HSe1EU\nxWLxrTeqf+blrvuuTDv6vF+f86l16kett8HE3I/XJeKds55LOMDe7d5Y+48lbVEU1Y0/svmd\nPgcSRlGUTS+OV3XFB2tvd8v8pz7So8Fzl+2z9Zn35f5Z3bDx9FM+fcCu71u7Iblg3mv/vPvW\na3/1l85r+R30vzPe+tZ+Tza1R1G0x7UvzTh+Wo9dldir+Y98ZOIuf+1c/tB9b96+16S+Wh61\n1sg/vrssiqKaht1aFz+Yv+nuD6+//x2vRVE0avJp+8SuufmNrus5Nm6ww+Ef2m29SeOWvTvv\n2X/cccfjK9ww6sMXPXTbOR/o9bF+d+KWn7r2hdw/Y/EROx34sd23mzZp4pi2xW8/99iMm297\nqGn5sNNYLH7yH1/54eFTe+xkoxHJOa2pKIrqJ5269M0r+jqu/hicCo+iqKP5qer693cub3DY\nvXNu2mfVOjRvxmmT9lrh0KZsu8cBe+268eS1Ryaz773z+lP/vP/2+//VvnzYXSxefdUL8z+/\naXeGNcTvpoG/sgM/5BLlqjqKoq0n1T07t+valPVTtjvi4D3XnzK+dcFbzz/8t9sefSX/e2eT\no6+Zdf2Jve4w1KqOFs/+6YZbfj7/rko1YzY65ND9p60/Ob7s3dlPP3DT3U91ZLNRFMUTI8+5\n9sMXHvfHzmatmWzN8ph0EAup6FdAp0F5PgEAANYo5U5m1zT9GjGazWbT7fPP2KekG3CPGPeB\n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\n2t21D6Ys5MbGRm5lc3MzX2tKKa2trbUCT9l3lPCTaYvbucWdna51x25NZXNzc7fF0Wh08uTJ\nfL22tta+jrQt5lmzvr6eDXJjY3Nhoet77uP29k7u43g8WVtbyyxra2u5jxsbG3nDja2trSzY\nzs6Oezpo9tyv+MhrWxyNtt39ra2tzJ7HcWNj86GHXH+T7I71WjuOrfDZ7NfW1tbWule0dpfS\n3GI75XV/J5O0tra2ubmpxRuPx84kW5YMNGjzOHlyLVvU5uZmlmR7u+ujnhotSx6stbVusLR1\nRePM9qyvNY1GI9WRnTz9x+OxtijtFkajUe7I9vZ2lmQ8HutvJOvr66r19cyyudm5+q2trTzl\nnStwkzH3XU/G0ahzPjs7O3nc3Vx2zyatrmw24/HE9nddzeXN7e0scOerR6NtxT7OkzGyK4FH\nKS1kgbe2uiXnbrCU6+sE1oOl1dW6Aje+Ozvb4/GOvjMej5W2J8p7JG2c6+sb+XprazQeL2R1\nuQHKQmrjXF/vXN/W1iizjEajrC7N3vYdes6tra2tre75qylPTBFZX1/PA2S13Q3Q9vZOHt+2\n77nFtbV1bV0LCweiwO3EnHrOpN3dyZNrWasbGxsHDmRLG62trb3gBX/7V39128tf/tRf/dWn\njEaTSy459k//6Tc99rEH85RfX19Xvmsj96tlb4VsW29nTWtp2QxOnjyZ2Tc3N52rb+fj1PVt\nZ21nz2kfsltra2utUlvX14K80fXlvq+vr29udjPLqSs/m9ryTSOjUedy4bBWqnRmCG7+tra2\ntry8E+9XqnRmqH0StW+S54KTPHz4MPupHr5UyZM6fKmUbDw/lL9sVzo7SBueXiKqoy+3GZm+\nhrtuid9j0Zyrq6/ZyTPuBAYtJJHEpQcaAyUZowmeZRT7SFKlGquirmabMWrOiLd9T7GMcG1b\nFpqA6fJ99AC5MdXagMIEdlxVBphiMWsehfHFNRcOX9Lbn0F2l0ak9ygUr0moB5dsa9IG2U/Q\nMVoWv8OpZce2rVgaZ9tsAqp2ky1mRp5NxswYu0AM0jThNMC0yoqF+50YtiqjIv03JzGJVZHt\nIOidY9HXk931udgsNSMxD2OEbPpzdjr9RSmzYIRQda6zzg1Cg5TwdLBDiQ8gIpPU1Da4v3jP\nzYIn4VK5h0t33+5qigdI+PNI39e7MDOv6IRnqhMwTWIKMzV1CWMX+1hwd8LnMvFdHYtzvG53\n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\nLP3Lv6xffVaYIj0gHB5hIkyb12KU064v/u/bdrzif/3H7US0tvhDIvqZjuEYET1pYuhrP5yl\n34I/rT2/t/f0W2XRL37xi5vNdVedU0899e1vf/thqeFmonZ7fXM6NbVlZGS+eN6+ffuOHRsy\npJ2aWuw8TO3YsYP/VK8PEdHw8MiOHTtGR8eIKMtq6htOS0sjxcPw8MjExFTxXKvFkiwuBl/s\nyfDZyMjIjh07arV6SF6UTkTHHXfc+PhE8bxly/S2bds7yScipXCanm51HrYmJhkgzcys3HDD\nQSLavbv51Kf2XPrKSnNmZpWIlpfrivm/+qvv/+mfXnr66U/52MdeEppr+/btW7asO5pNT09v\n2zZePBfNlWU1IhoZGd2xY8fQ0BB1+ndoaL1Ttm3bNjW1WjxPTW1ZWSnl0vbt24aHh7dvHyei\nycmRhzxknZk8Lw91hodH2fMI22bVsMbItyNJqKRUJ2rsfflNxFe6oMlJf/xMTvYwueIw5fj4\ncIfJno/+ZHP13EQyKwSMQo26mIn2JxSIzQQu8DlBwGitVou3ZPiw+O+hD33I9PRIeDsxMTEx\nMbGwMGwTDA2Vn8mm4yeRGa9vmAtEVK8Pg/d1lkPGPxsdHQ/Pajpwxh7+8B27d6/P0/Hxcsjx\n52K2dpIPB3iiXh9CJfI6TkxMBp5HR0eDFB0aGp6a2tL5nrZv386SbOHJR0bWOlyNT0xMhrpv\n3botfMYn0dat20JLTk5ODg2tXwI7MjJSr69Xv1arBRlOlO3YsSNs/bdu3ToyMtpJPhXU8tHR\n0S1bpkPpIUme51x2TU9Ph+QTE5MTE6Od0ke3bl0vMctqxx23Iwzd7du3B4anpqZGR2dD8snJ\nsdBcW7aEZskY87R169ZCirI30yHEcyA+CENFSPf7RGiH4eHhkZGxDsNCr+N9HWS+KmJoaJgj\nGrXaMHuuE9Hw8FDotbGxsSJJmJv1+pCcDmXOGNHTQukhDzmueJARV8vxXKuV7TY0NCy1Tf+z\n0CYF2yGJTF7jDPNJxycjn8tDQ0PFtqdTYvkTL5EnHxkZDQ2sJmMYgaq+vOMiZhBYRqFn4o3P\nm6ughz50R+GqkmXZ1NQUGRk+NFQyzAckrwjvxHp9iFmyZLxeWVaWPjU1FUT66OhYaOGhoSHe\nqkGqENH4+FR45p04MjJSVPlZz3rkf/2vTz3++Ift3t20nw0P82wnQukjIyNheNTr9bGxifDZ\n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\n/SnCFaPnHaNsFqFNFGyera0+DZI3Myl90WlujtIt9E7gdYxOj/fbVT98U+oEUHdb0hAalYDc\ni/oRY7zkJSu+8Y3Df/mX22ZhcwAAAAAAAAiHNz8K0kZDHKOsT+Q4xrJlmdDZMxmbd3sISwvN\nMeoRRv1D6elkjmNQ/Y4XRnlZlveumqZu2/rNNw9v397G8onReuv9/amjR0e2b2+7995tbC2J\nhPWOd2z5xjcO33DDKqIWM+44NVelDxBGTVPbvr3NcYwrrug///xqtYOAVfg65nK5CDXZUHbv\n7jhwoCvUFLJlSwsdGBnJ0zg5L5pWT8ZSYQlerr12YPnyTE9PckaLnqZWaV4GPba+h8K2fRyj\nglDo9m+Gh9IHGE5l8e8yydLzk8xkGpBjVOYS9S92P1/ILtSzFgijoAYsS1+xotLGt7bG7r9/\nx4MPnn/rrWv4x/ToaBNrlf/2b3dfffUy09T37OmYXoLGFuW7CqGkoGFo+byvMCo68+mLDiuD\nOO0YrU7gyTFam2OUELJyZUgqVUY26xw5svTQoV7F6WtCcYMTiQXkGCWELFuWgWMfAAAAAADM\nF7xrwSOMSmtGB8AXXSBc12NoKKfy3pvLRfhOjaa5NqnWUHqZY3TbttZCIXLllf10+ljMItPx\ndkyWtW2d9/fx+8Wi97LZygRHj478/d8fOHSol82SSFiWpTMtWLH4Uq2h5QE6na5r27a1PvHE\nte95zw7eCheQSFGo5UvJZp3m5mrfs6Mj/nd/t/fw4d7gDdu+vZKLc+3aJpkRb+Z2Ud+DSlO1\ndnX5RFjWQaNC6elh5/3I/E9exT9AKHQbLf1vzMB8wbLyR1KVUybFymZX3OD6shjPHhBGBaBT\ngNpYs6YSTd/SErVtfcOGZsPQWOOXz0cuv3wJm7ipKXr99St/+cvnX331AB3DV6Vnk7HZu7sT\n73//Ofxdahgaa4N5vFHtrFWgrRFN7xKYY7SyFvWHwrp1hdBp6Fq2bGl597u3L12aCp2+DhQ3\nuIGVjvjWS8jyDgAAAAAAwBlBQG1St2NUVbaQOUb5EDoiz6+VzTp8lJsnx2iIYzQgbRcvzw0N\n5X74wyPvfOdW+i99saeqK5NlC4Uor2byNgiWc5M6RoXtn16dS0EL1UV1XbMs/brrBgsFcZky\nDEPzOg35X9lf1leybeOaawZ8p08kLF/dOZ22m5urm0S7nFQqDTjaS5emtm5tTaXsgwe7kkn/\n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\nAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 480,
       "width": 900
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "fig(15,8)\n",
    "timeplot <- ggplot(data = total_num_sold, aes(x = date)) + \n",
    "            geom_line(aes(y = num_sold),  color = 'darkblue') +\n",
    "            labs(title = 'Total number of sales per date') +\n",
    "            theme(title = element_text(size=22), axis.title.x = element_text(size=18), axis.title.y = element_text(size=18),\n",
    "                 axis.title = element_text(size = 18))\n",
    "\n",
    "print(timeplot)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "c03e4b32",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:15.245620Z",
     "iopub.status.busy": "2025-01-03T15:32:15.244036Z",
     "iopub.status.idle": "2025-01-03T15:32:15.284407Z",
     "shell.execute_reply": "2025-01-03T15:32:15.281840Z"
    },
    "papermill": {
     "duration": 0.066085,
     "end_time": "2025-01-03T15:32:15.287580",
     "exception": false,
     "start_time": "2025-01-03T15:32:15.221495",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>date</th><th scope=col>country</th><th scope=col>store</th><th scope=col>product</th><th scope=col>num_sold</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>weekday</th></tr>\n",
       "\t<tr><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Holographic Goose </td><td> NA</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle            </td><td>973</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle Tiers      </td><td>906</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler          </td><td>423</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler Dark Mode</td><td>491</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "\t<tr><td>2010-01-01</td><td>Canada</td><td>Stickers for Less</td><td>Holographic Goose </td><td>300</td><td>2010</td><td>1</td><td>1</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " date & country & store & product & num\\_sold & year & month & day & weekday\\\\\n",
       " <date> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Holographic Goose  &  NA & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kaggle             & 973 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kaggle Tiers       & 906 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kerneler           & 423 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Discount Stickers & Kerneler Dark Mode & 491 & 2010 & 1 & 1 & 6\\\\\n",
       "\t 2010-01-01 & Canada & Stickers for Less & Holographic Goose  & 300 & 2010 & 1 & 1 & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 9\n",
       "\n",
       "| date &lt;date&gt; | country &lt;chr&gt; | store &lt;chr&gt; | product &lt;chr&gt; | num_sold &lt;dbl&gt; | year &lt;dbl&gt; | month &lt;dbl&gt; | day &lt;int&gt; | weekday &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 2010-01-01 | Canada | Discount Stickers | Holographic Goose  |  NA | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kaggle             | 973 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kaggle Tiers       | 906 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kerneler           | 423 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Discount Stickers | Kerneler Dark Mode | 491 | 2010 | 1 | 1 | 6 |\n",
       "| 2010-01-01 | Canada | Stickers for Less | Holographic Goose  | 300 | 2010 | 1 | 1 | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "  date       country store             product            num_sold year month\n",
       "1 2010-01-01 Canada  Discount Stickers Holographic Goose   NA      2010 1    \n",
       "2 2010-01-01 Canada  Discount Stickers Kaggle             973      2010 1    \n",
       "3 2010-01-01 Canada  Discount Stickers Kaggle Tiers       906      2010 1    \n",
       "4 2010-01-01 Canada  Discount Stickers Kerneler           423      2010 1    \n",
       "5 2010-01-01 Canada  Discount Stickers Kerneler Dark Mode 491      2010 1    \n",
       "6 2010-01-01 Canada  Stickers for Less Holographic Goose  300      2010 1    \n",
       "  day weekday\n",
       "1 1   6      \n",
       "2 1   6      \n",
       "3 1   6      \n",
       "4 1   6      \n",
       "5 1   6      \n",
       "6 1   6      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(train)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "5f321683",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:15.331402Z",
     "iopub.status.busy": "2025-01-03T15:32:15.329735Z",
     "iopub.status.idle": "2025-01-03T15:32:16.338673Z",
     "shell.execute_reply": "2025-01-03T15:32:16.336470Z"
    },
    "papermill": {
     "duration": 1.041478,
     "end_time": "2025-01-03T15:32:16.348948",
     "exception": false,
     "start_time": "2025-01-03T15:32:15.307470",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'date'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
     },
     "metadata": {
      "image/png": {
       "height": 480,
       "width": 900
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "num_sold_by_country <- train %>% dplyr::group_by(date, country) %>% dplyr::summarize(num_sold_by_country = sum(num_sold, na.rm = TRUE))\n",
    "\n",
    "fig(15,8)\n",
    "timeplot <- ggplot(data = num_sold_by_country, aes(x = date, color = country)) + \n",
    "            geom_line(aes(y = num_sold_by_country)) +\n",
    "            labs(title = 'Total number of sales per date by country') +\n",
    "            theme(title = element_text(size=22), axis.title.x = element_text(size=18), axis.title.y = element_text(size=18),\n",
    "                 axis.title = element_text(size = 18))\n",
    "\n",
    "print(timeplot)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "61b28d3f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:16.413281Z",
     "iopub.status.busy": "2025-01-03T15:32:16.411691Z",
     "iopub.status.idle": "2025-01-03T15:32:17.439774Z",
     "shell.execute_reply": "2025-01-03T15:32:17.437668Z"
    },
    "papermill": {
     "duration": 1.06943,
     "end_time": "2025-01-03T15:32:17.448852",
     "exception": false,
     "start_time": "2025-01-03T15:32:16.379422",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'date'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
     },
     "metadata": {
      "image/png": {
       "height": 480,
       "width": 900
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "num_sold_by_product <- train %>% dplyr::group_by(date, product) %>% dplyr::summarize(num_sold_prod = sum(num_sold, na.rm = TRUE))\n",
    "\n",
    "fig(15,8)\n",
    "timeplot <- ggplot(data = num_sold_by_product, aes(x = date, color = product)) + \n",
    "            geom_line(aes(y = num_sold_prod)) +\n",
    "            labs(title = 'Total number of sales per date by product') +\n",
    "            theme(title = element_text(size=22), axis.title.x = element_text(size=18), axis.title.y = element_text(size=18),\n",
    "                 axis.title = element_text(size = 18))\n",
    "\n",
    "print(timeplot)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "51c38f83",
   "metadata": {
    "papermill": {
     "duration": 0.041244,
     "end_time": "2025-01-03T15:32:17.532581",
     "exception": false,
     "start_time": "2025-01-03T15:32:17.491337",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<h3>Modelling</h3>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "61dc712b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:17.615958Z",
     "iopub.status.busy": "2025-01-03T15:32:17.614323Z",
     "iopub.status.idle": "2025-01-03T15:32:19.367205Z",
     "shell.execute_reply": "2025-01-03T15:32:19.365354Z"
    },
    "papermill": {
     "duration": 1.798352,
     "end_time": "2025-01-03T15:32:19.371005",
     "exception": false,
     "start_time": "2025-01-03T15:32:17.572653",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>countryCanada</th><th scope=col>countryFinland</th><th scope=col>countryItaly</th><th scope=col>countryKenya</th><th scope=col>countryNorway</th><th scope=col>countrySingapore</th><th scope=col>storeDiscount.Stickers</th><th scope=col>storePremium.Sticker.Mart</th><th scope=col>storeStickers.for.Less</th><th scope=col>productHolographic.Goose</th><th scope=col>productKaggle</th><th scope=col>productKaggle.Tiers</th><th scope=col>productKerneler</th><th scope=col>productKerneler.Dark.Mode</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 14\n",
       "\\begin{tabular}{r|llllllllllllll}\n",
       "  & countryCanada & countryFinland & countryItaly & countryKenya & countryNorway & countrySingapore & storeDiscount.Stickers & storePremium.Sticker.Mart & storeStickers.for.Less & productHolographic.Goose & productKaggle & productKaggle.Tiers & productKerneler & productKerneler.Dark.Mode\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 0 & 0 & 0 & 0\\\\\n",
       "\t2 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 1 & 0 & 0 & 0\\\\\n",
       "\t3 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0\\\\\n",
       "\t4 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0\\\\\n",
       "\t5 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 1\\\\\n",
       "\t6 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 0\\\\\n",
       "\t7 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 1 & 0 & 0 & 0\\\\\n",
       "\t8 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 0 & 0\\\\\n",
       "\t9 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 1 & 0\\\\\n",
       "\t10 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 14\n",
       "\n",
       "| <!--/--> | countryCanada &lt;dbl&gt; | countryFinland &lt;dbl&gt; | countryItaly &lt;dbl&gt; | countryKenya &lt;dbl&gt; | countryNorway &lt;dbl&gt; | countrySingapore &lt;dbl&gt; | storeDiscount.Stickers &lt;dbl&gt; | storePremium.Sticker.Mart &lt;dbl&gt; | storeStickers.for.Less &lt;dbl&gt; | productHolographic.Goose &lt;dbl&gt; | productKaggle &lt;dbl&gt; | productKaggle.Tiers &lt;dbl&gt; | productKerneler &lt;dbl&gt; | productKerneler.Dark.Mode &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |\n",
       "| 2 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |\n",
       "| 3 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |\n",
       "| 4 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |\n",
       "| 5 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |\n",
       "| 6 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |\n",
       "| 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 |\n",
       "| 8 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |\n",
       "| 9 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 |\n",
       "| 10 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "   countryCanada countryFinland countryItaly countryKenya countryNorway\n",
       "1  1             0              0            0            0            \n",
       "2  1             0              0            0            0            \n",
       "3  1             0              0            0            0            \n",
       "4  1             0              0            0            0            \n",
       "5  1             0              0            0            0            \n",
       "6  1             0              0            0            0            \n",
       "7  1             0              0            0            0            \n",
       "8  1             0              0            0            0            \n",
       "9  1             0              0            0            0            \n",
       "10 1             0              0            0            0            \n",
       "   countrySingapore storeDiscount.Stickers storePremium.Sticker.Mart\n",
       "1  0                1                      0                        \n",
       "2  0                1                      0                        \n",
       "3  0                1                      0                        \n",
       "4  0                1                      0                        \n",
       "5  0                1                      0                        \n",
       "6  0                0                      0                        \n",
       "7  0                0                      0                        \n",
       "8  0                0                      0                        \n",
       "9  0                0                      0                        \n",
       "10 0                0                      0                        \n",
       "   storeStickers.for.Less productHolographic.Goose productKaggle\n",
       "1  0                      1                        0            \n",
       "2  0                      0                        1            \n",
       "3  0                      0                        0            \n",
       "4  0                      0                        0            \n",
       "5  0                      0                        0            \n",
       "6  1                      1                        0            \n",
       "7  1                      0                        1            \n",
       "8  1                      0                        0            \n",
       "9  1                      0                        0            \n",
       "10 1                      0                        0            \n",
       "   productKaggle.Tiers productKerneler productKerneler.Dark.Mode\n",
       "1  0                   0               0                        \n",
       "2  0                   0               0                        \n",
       "3  1                   0               0                        \n",
       "4  0                   1               0                        \n",
       "5  0                   0               1                        \n",
       "6  0                   0               0                        \n",
       "7  0                   0               0                        \n",
       "8  1                   0               0                        \n",
       "9  0                   1               0                        \n",
       "10 0                   0               1                        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "temp <- train\n",
    "formula <- paste('~', paste(CAT_FEATS, collapse =  '+'), collapse = '')\n",
    "ohe <- dummyVars(formula, data = temp, fullRank = FALSE)\n",
    "ohe_df <- data.frame(predict(ohe, temp))\n",
    "#train_ohe1 = cbind(temp1$date, ohe_df1, temp1$num_sold)\n",
    "head(ohe_df, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "908eb528",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:19.498802Z",
     "iopub.status.busy": "2025-01-03T15:32:19.497287Z",
     "iopub.status.idle": "2025-01-03T15:32:19.880880Z",
     "shell.execute_reply": "2025-01-03T15:32:19.879199Z"
    },
    "papermill": {
     "duration": 0.429494,
     "end_time": "2025-01-03T15:32:19.883306",
     "exception": false,
     "start_time": "2025-01-03T15:32:19.453812",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 6 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>weekday</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td></tr>\n",
       "\t<tr><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td></tr>\n",
       "\t<tr><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td></tr>\n",
       "\t<tr><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td></tr>\n",
       "\t<tr><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td></tr>\n",
       "\t<tr><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 6 × 4 of type dbl\n",
       "\\begin{tabular}{llll}\n",
       " year & month & day & weekday\\\\\n",
       "\\hline\n",
       "\t -1.500241 & -1.601263 & -1.673844 & 0.9987765\\\\\n",
       "\t -1.500241 & -1.601263 & -1.673844 & 0.9987765\\\\\n",
       "\t -1.500241 & -1.601263 & -1.673844 & 0.9987765\\\\\n",
       "\t -1.500241 & -1.601263 & -1.673844 & 0.9987765\\\\\n",
       "\t -1.500241 & -1.601263 & -1.673844 & 0.9987765\\\\\n",
       "\t -1.500241 & -1.601263 & -1.673844 & 0.9987765\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 6 × 4 of type dbl\n",
       "\n",
       "| year | month | day | weekday |\n",
       "|---|---|---|---|\n",
       "| -1.500241 | -1.601263 | -1.673844 | 0.9987765 |\n",
       "| -1.500241 | -1.601263 | -1.673844 | 0.9987765 |\n",
       "| -1.500241 | -1.601263 | -1.673844 | 0.9987765 |\n",
       "| -1.500241 | -1.601263 | -1.673844 | 0.9987765 |\n",
       "| -1.500241 | -1.601263 | -1.673844 | 0.9987765 |\n",
       "| -1.500241 | -1.601263 | -1.673844 | 0.9987765 |\n",
       "\n"
      ],
      "text/plain": [
       "     year      month     day       weekday  \n",
       "[1,] -1.500241 -1.601263 -1.673844 0.9987765\n",
       "[2,] -1.500241 -1.601263 -1.673844 0.9987765\n",
       "[3,] -1.500241 -1.601263 -1.673844 0.9987765\n",
       "[4,] -1.500241 -1.601263 -1.673844 0.9987765\n",
       "[5,] -1.500241 -1.601263 -1.673844 0.9987765\n",
       "[6,] -1.500241 -1.601263 -1.673844 0.9987765"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "scaled_df <- scale(temp[, NUM_FEATS])\n",
    "head(scaled_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "3d79c32d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:19.964374Z",
     "iopub.status.busy": "2025-01-03T15:32:19.962775Z",
     "iopub.status.idle": "2025-01-03T15:32:19.980426Z",
     "shell.execute_reply": "2025-01-03T15:32:19.978684Z"
    },
    "papermill": {
     "duration": 0.061317,
     "end_time": "2025-01-03T15:32:19.983123",
     "exception": false,
     "start_time": "2025-01-03T15:32:19.921806",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "target_log <- log(1.0 + temp[, target])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "0d4a8162",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:20.064726Z",
     "iopub.status.busy": "2025-01-03T15:32:20.063179Z",
     "iopub.status.idle": "2025-01-03T15:32:20.211122Z",
     "shell.execute_reply": "2025-01-03T15:32:20.209378Z"
    },
    "papermill": {
     "duration": 0.192104,
     "end_time": "2025-01-03T15:32:20.213604",
     "exception": false,
     "start_time": "2025-01-03T15:32:20.021500",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 19</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>countryCanada</th><th scope=col>countryFinland</th><th scope=col>countryItaly</th><th scope=col>countryKenya</th><th scope=col>countryNorway</th><th scope=col>countrySingapore</th><th scope=col>storeDiscount.Stickers</th><th scope=col>storePremium.Sticker.Mart</th><th scope=col>storeStickers.for.Less</th><th scope=col>productHolographic.Goose</th><th scope=col>productKaggle</th><th scope=col>productKaggle.Tiers</th><th scope=col>productKerneler</th><th scope=col>productKerneler.Dark.Mode</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>weekday</th><th scope=col>num_sold</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td><td>      NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td><td>6.881411</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td><td>6.810142</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td><td>6.049733</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td><td>6.198479</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>-1.500241</td><td>-1.601263</td><td>-1.673844</td><td>0.9987765</td><td>5.707110</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 19\n",
       "\\begin{tabular}{r|lllllllllllllllllll}\n",
       "  & countryCanada & countryFinland & countryItaly & countryKenya & countryNorway & countrySingapore & storeDiscount.Stickers & storePremium.Sticker.Mart & storeStickers.for.Less & productHolographic.Goose & productKaggle & productKaggle.Tiers & productKerneler & productKerneler.Dark.Mode & year & month & day & weekday & num\\_sold\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & -1.500241 & -1.601263 & -1.673844 & 0.9987765 &       NA\\\\\n",
       "\t2 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & -1.500241 & -1.601263 & -1.673844 & 0.9987765 & 6.881411\\\\\n",
       "\t3 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & -1.500241 & -1.601263 & -1.673844 & 0.9987765 & 6.810142\\\\\n",
       "\t4 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & -1.500241 & -1.601263 & -1.673844 & 0.9987765 & 6.049733\\\\\n",
       "\t5 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & -1.500241 & -1.601263 & -1.673844 & 0.9987765 & 6.198479\\\\\n",
       "\t6 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 0 & -1.500241 & -1.601263 & -1.673844 & 0.9987765 & 5.707110\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 19\n",
       "\n",
       "| <!--/--> | countryCanada &lt;dbl&gt; | countryFinland &lt;dbl&gt; | countryItaly &lt;dbl&gt; | countryKenya &lt;dbl&gt; | countryNorway &lt;dbl&gt; | countrySingapore &lt;dbl&gt; | storeDiscount.Stickers &lt;dbl&gt; | storePremium.Sticker.Mart &lt;dbl&gt; | storeStickers.for.Less &lt;dbl&gt; | productHolographic.Goose &lt;dbl&gt; | productKaggle &lt;dbl&gt; | productKaggle.Tiers &lt;dbl&gt; | productKerneler &lt;dbl&gt; | productKerneler.Dark.Mode &lt;dbl&gt; | year &lt;dbl&gt; | month &lt;dbl&gt; | day &lt;dbl&gt; | weekday &lt;dbl&gt; | num_sold &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | -1.500241 | -1.601263 | -1.673844 | 0.9987765 |       NA |\n",
       "| 2 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | -1.500241 | -1.601263 | -1.673844 | 0.9987765 | 6.881411 |\n",
       "| 3 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | -1.500241 | -1.601263 | -1.673844 | 0.9987765 | 6.810142 |\n",
       "| 4 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | -1.500241 | -1.601263 | -1.673844 | 0.9987765 | 6.049733 |\n",
       "| 5 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | -1.500241 | -1.601263 | -1.673844 | 0.9987765 | 6.198479 |\n",
       "| 6 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | -1.500241 | -1.601263 | -1.673844 | 0.9987765 | 5.707110 |\n",
       "\n"
      ],
      "text/plain": [
       "  countryCanada countryFinland countryItaly countryKenya countryNorway\n",
       "1 1             0              0            0            0            \n",
       "2 1             0              0            0            0            \n",
       "3 1             0              0            0            0            \n",
       "4 1             0              0            0            0            \n",
       "5 1             0              0            0            0            \n",
       "6 1             0              0            0            0            \n",
       "  countrySingapore storeDiscount.Stickers storePremium.Sticker.Mart\n",
       "1 0                1                      0                        \n",
       "2 0                1                      0                        \n",
       "3 0                1                      0                        \n",
       "4 0                1                      0                        \n",
       "5 0                1                      0                        \n",
       "6 0                0                      0                        \n",
       "  storeStickers.for.Less productHolographic.Goose productKaggle\n",
       "1 0                      1                        0            \n",
       "2 0                      0                        1            \n",
       "3 0                      0                        0            \n",
       "4 0                      0                        0            \n",
       "5 0                      0                        0            \n",
       "6 1                      1                        0            \n",
       "  productKaggle.Tiers productKerneler productKerneler.Dark.Mode year     \n",
       "1 0                   0               0                         -1.500241\n",
       "2 0                   0               0                         -1.500241\n",
       "3 1                   0               0                         -1.500241\n",
       "4 0                   1               0                         -1.500241\n",
       "5 0                   0               1                         -1.500241\n",
       "6 0                   0               0                         -1.500241\n",
       "  month     day       weekday   num_sold\n",
       "1 -1.601263 -1.673844 0.9987765       NA\n",
       "2 -1.601263 -1.673844 0.9987765 6.881411\n",
       "3 -1.601263 -1.673844 0.9987765 6.810142\n",
       "4 -1.601263 -1.673844 0.9987765 6.049733\n",
       "5 -1.601263 -1.673844 0.9987765 6.198479\n",
       "6 -1.601263 -1.673844 0.9987765 5.707110"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "X_train <- cbind(ohe_df, scaled_df, target_log)\n",
    "head(X_train)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "b0a3a149",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:20.295419Z",
     "iopub.status.busy": "2025-01-03T15:32:20.293803Z",
     "iopub.status.idle": "2025-01-03T15:32:20.481755Z",
     "shell.execute_reply": "2025-01-03T15:32:20.480048Z"
    },
    "papermill": {
     "duration": 0.231646,
     "end_time": "2025-01-03T15:32:20.484142",
     "exception": false,
     "start_time": "2025-01-03T15:32:20.252496",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>221259</li><li>19</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 221259\n",
       "\\item 19\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 221259\n",
       "2. 19\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 221259     19"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "X_train_clean <- na.omit(X_train)\n",
    "dim(X_train_clean)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "ce1a1dc5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:20.566960Z",
     "iopub.status.busy": "2025-01-03T15:32:20.565164Z",
     "iopub.status.idle": "2025-01-03T15:32:20.965697Z",
     "shell.execute_reply": "2025-01-03T15:32:20.963474Z"
    },
    "papermill": {
     "duration": 0.446501,
     "end_time": "2025-01-03T15:32:20.969719",
     "exception": false,
     "start_time": "2025-01-03T15:32:20.523218",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "param_list = list( \n",
    "objective = \"reg:linear\", \n",
    "eta = 0.01, \n",
    "gamma = 1, \n",
    "max_depth = 8, \n",
    "subsample = 0.8, \n",
    "colsample_bytree = 0.5\n",
    ") \n",
    "\n",
    "Dtrain <- xgb.DMatrix(data = as.matrix(select(X_train_clean, -num_sold)), label = X_train_clean$num_sold)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "aa0fa7ca",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:32:21.056098Z",
     "iopub.status.busy": "2025-01-03T15:32:21.054527Z",
     "iopub.status.idle": "2025-01-03T15:42:10.084819Z",
     "shell.execute_reply": "2025-01-03T15:42:10.082977Z"
    },
    "papermill": {
     "duration": 589.141557,
     "end_time": "2025-01-03T15:42:10.152901",
     "exception": false,
     "start_time": "2025-01-03T15:32:21.011344",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[15:32:21] WARNING: src/objective/regression_obj.cu:213: reg:linear is now deprecated in favor of reg:squarederror.\n",
      "[15:32:21] WARNING: src/objective/regression_obj.cu:213: reg:linear is now deprecated in favor of reg:squarederror.\n",
      "[15:32:21] WARNING: src/objective/regression_obj.cu:213: reg:linear is now deprecated in favor of reg:squarederror.\n",
      "[15:32:22] WARNING: src/objective/regression_obj.cu:213: reg:linear is now deprecated in favor of reg:squarederror.\n",
      "[15:32:22] WARNING: src/objective/regression_obj.cu:213: reg:linear is now deprecated in favor of reg:squarederror.\n",
      "[1]\ttrain-mape:0.896426+0.000460\ttest-mape:0.896428+0.000443 \n",
      "Multiple eval metrics are present. Will use test_mape for early stopping.\n",
      "Will train until test_mape hasn't improved in 30 rounds.\n",
      "\n",
      "[2]\ttrain-mape:0.887014+0.000683\ttest-mape:0.887012+0.000715 \n",
      "[3]\ttrain-mape:0.877752+0.000683\ttest-mape:0.877746+0.000753 \n",
      "[4]\ttrain-mape:0.868238+0.000567\ttest-mape:0.868229+0.000641 \n",
      "[5]\ttrain-mape:0.859486+0.000556\ttest-mape:0.859477+0.000624 \n",
      "[6]\ttrain-mape:0.850138+0.000350\ttest-mape:0.850127+0.000418 \n",
      "[7]\ttrain-mape:0.841187+0.000589\ttest-mape:0.841172+0.000682 \n",
      "[8]\ttrain-mape:0.832328+0.000561\ttest-mape:0.832314+0.000654 \n",
      "[9]\ttrain-mape:0.823466+0.000564\ttest-mape:0.823447+0.000670 \n",
      "[10]\ttrain-mape:0.814834+0.000449\ttest-mape:0.814814+0.000565 \n",
      "[11]\ttrain-mape:0.806451+0.000563\ttest-mape:0.806430+0.000697 \n",
      "[12]\ttrain-mape:0.797873+0.000289\ttest-mape:0.797856+0.000425 \n",
      "[13]\ttrain-mape:0.789634+0.000499\ttest-mape:0.789614+0.000615 \n",
      "[14]\ttrain-mape:0.781500+0.000619\ttest-mape:0.781477+0.000742 \n",
      "[15]\ttrain-mape:0.773274+0.000756\ttest-mape:0.773250+0.000845 \n",
      "[16]\ttrain-mape:0.765015+0.000575\ttest-mape:0.764993+0.000690 \n",
      "[17]\ttrain-mape:0.756490+0.000605\ttest-mape:0.756467+0.000723 \n",
      "[18]\ttrain-mape:0.748574+0.000701\ttest-mape:0.748547+0.000849 \n",
      "[19]\ttrain-mape:0.740699+0.000637\ttest-mape:0.740670+0.000768 \n",
      "[20]\ttrain-mape:0.732844+0.000817\ttest-mape:0.732812+0.000941 \n",
      "[21]\ttrain-mape:0.725440+0.000811\ttest-mape:0.725410+0.000933 \n",
      "[22]\ttrain-mape:0.717662+0.000678\ttest-mape:0.717630+0.000820 \n",
      "[23]\ttrain-mape:0.710084+0.000567\ttest-mape:0.710058+0.000720 \n",
      "[24]\ttrain-mape:0.702463+0.000341\ttest-mape:0.702439+0.000514 \n",
      "[25]\ttrain-mape:0.695143+0.000498\ttest-mape:0.695116+0.000626 \n",
      "[26]\ttrain-mape:0.687683+0.000589\ttest-mape:0.687660+0.000695 \n",
      "[27]\ttrain-mape:0.680337+0.000814\ttest-mape:0.680307+0.000952 \n",
      "[28]\ttrain-mape:0.673059+0.000984\ttest-mape:0.673024+0.001104 \n",
      "[29]\ttrain-mape:0.665985+0.001105\ttest-mape:0.665948+0.001206 \n",
      "[30]\ttrain-mape:0.658972+0.001459\ttest-mape:0.658932+0.001562 \n",
      "[31]\ttrain-mape:0.652127+0.001678\ttest-mape:0.652082+0.001781 \n",
      "[32]\ttrain-mape:0.645222+0.001841\ttest-mape:0.645180+0.001935 \n",
      "[33]\ttrain-mape:0.638411+0.001775\ttest-mape:0.638374+0.001863 \n",
      "[34]\ttrain-mape:0.631719+0.001850\ttest-mape:0.631681+0.001953 \n",
      "[35]\ttrain-mape:0.624638+0.001955\ttest-mape:0.624598+0.002066 \n",
      "[36]\ttrain-mape:0.617897+0.002173\ttest-mape:0.617859+0.002278 \n",
      "[37]\ttrain-mape:0.611348+0.002485\ttest-mape:0.611307+0.002594 \n",
      "[38]\ttrain-mape:0.604799+0.002538\ttest-mape:0.604756+0.002650 \n",
      "[39]\ttrain-mape:0.598417+0.002675\ttest-mape:0.598373+0.002778 \n",
      "[40]\ttrain-mape:0.591807+0.002752\ttest-mape:0.591764+0.002862 \n",
      "[41]\ttrain-mape:0.585437+0.002564\ttest-mape:0.585390+0.002684 \n",
      "[42]\ttrain-mape:0.579001+0.002635\ttest-mape:0.578955+0.002749 \n",
      "[43]\ttrain-mape:0.572679+0.002630\ttest-mape:0.572632+0.002737 \n",
      "[44]\ttrain-mape:0.566344+0.002703\ttest-mape:0.566296+0.002819 \n",
      "[45]\ttrain-mape:0.560373+0.002550\ttest-mape:0.560326+0.002668 \n",
      "[46]\ttrain-mape:0.554338+0.002453\ttest-mape:0.554289+0.002578 \n",
      "[47]\ttrain-mape:0.548467+0.002681\ttest-mape:0.548417+0.002804 \n",
      "[48]\ttrain-mape:0.542899+0.002647\ttest-mape:0.542850+0.002763 \n",
      "[49]\ttrain-mape:0.537284+0.002821\ttest-mape:0.537232+0.002939 \n",
      "[50]\ttrain-mape:0.531466+0.002518\ttest-mape:0.531417+0.002639 \n",
      "[51]\ttrain-mape:0.525661+0.002401\ttest-mape:0.525617+0.002522 \n",
      "[52]\ttrain-mape:0.519977+0.002534\ttest-mape:0.519930+0.002649 \n",
      "[53]\ttrain-mape:0.514502+0.002533\ttest-mape:0.514453+0.002660 \n",
      "[54]\ttrain-mape:0.509078+0.002321\ttest-mape:0.509030+0.002433 \n",
      "[55]\ttrain-mape:0.503477+0.002279\ttest-mape:0.503424+0.002406 \n",
      "[56]\ttrain-mape:0.498290+0.002189\ttest-mape:0.498237+0.002326 \n",
      "[57]\ttrain-mape:0.492824+0.002129\ttest-mape:0.492771+0.002281 \n",
      "[58]\ttrain-mape:0.487597+0.001918\ttest-mape:0.487546+0.002074 \n",
      "[59]\ttrain-mape:0.482471+0.001977\ttest-mape:0.482419+0.002131 \n",
      "[60]\ttrain-mape:0.477269+0.002054\ttest-mape:0.477219+0.002222 \n",
      "[61]\ttrain-mape:0.471976+0.001885\ttest-mape:0.471928+0.002059 \n",
      "[62]\ttrain-mape:0.466959+0.001840\ttest-mape:0.466913+0.002018 \n",
      "[63]\ttrain-mape:0.461862+0.001609\ttest-mape:0.461825+0.001790 \n",
      "[64]\ttrain-mape:0.456950+0.001413\ttest-mape:0.456917+0.001589 \n",
      "[65]\ttrain-mape:0.452160+0.001208\ttest-mape:0.452130+0.001371 \n",
      "[66]\ttrain-mape:0.447446+0.001263\ttest-mape:0.447417+0.001415 \n",
      "[67]\ttrain-mape:0.442708+0.001206\ttest-mape:0.442679+0.001365 \n",
      "[68]\ttrain-mape:0.438048+0.001288\ttest-mape:0.438022+0.001457 \n",
      "[69]\ttrain-mape:0.433527+0.001262\ttest-mape:0.433500+0.001423 \n",
      "[70]\ttrain-mape:0.428970+0.001183\ttest-mape:0.428944+0.001337 \n",
      "[71]\ttrain-mape:0.424673+0.001166\ttest-mape:0.424648+0.001318 \n",
      "[72]\ttrain-mape:0.420251+0.001043\ttest-mape:0.420233+0.001206 \n",
      "[73]\ttrain-mape:0.415953+0.001044\ttest-mape:0.415929+0.001194 \n",
      "[74]\ttrain-mape:0.411760+0.001040\ttest-mape:0.411735+0.001191 \n",
      "[75]\ttrain-mape:0.407505+0.000906\ttest-mape:0.407482+0.001046 \n",
      "[76]\ttrain-mape:0.403242+0.000785\ttest-mape:0.403220+0.000917 \n",
      "[77]\ttrain-mape:0.399147+0.000746\ttest-mape:0.399129+0.000892 \n",
      "[78]\ttrain-mape:0.395109+0.000776\ttest-mape:0.395092+0.000920 \n",
      "[79]\ttrain-mape:0.391040+0.000673\ttest-mape:0.391026+0.000816 \n",
      "[80]\ttrain-mape:0.387040+0.000625\ttest-mape:0.387028+0.000756 \n",
      "[81]\ttrain-mape:0.383096+0.000593\ttest-mape:0.383085+0.000725 \n",
      "[82]\ttrain-mape:0.379151+0.000602\ttest-mape:0.379134+0.000743 \n",
      "[83]\ttrain-mape:0.375325+0.000592\ttest-mape:0.375309+0.000740 \n",
      "[84]\ttrain-mape:0.371512+0.000616\ttest-mape:0.371492+0.000772 \n",
      "[85]\ttrain-mape:0.367783+0.000591\ttest-mape:0.367760+0.000740 \n",
      "[86]\ttrain-mape:0.364043+0.000509\ttest-mape:0.364020+0.000669 \n",
      "[87]\ttrain-mape:0.360366+0.000451\ttest-mape:0.360343+0.000614 \n",
      "[88]\ttrain-mape:0.356742+0.000430\ttest-mape:0.356721+0.000597 \n",
      "[89]\ttrain-mape:0.353158+0.000411\ttest-mape:0.353137+0.000572 \n",
      "[90]\ttrain-mape:0.349552+0.000333\ttest-mape:0.349534+0.000500 \n",
      "[91]\ttrain-mape:0.346038+0.000276\ttest-mape:0.346019+0.000451 \n",
      "[92]\ttrain-mape:0.342542+0.000263\ttest-mape:0.342523+0.000435 \n",
      "[93]\ttrain-mape:0.339121+0.000269\ttest-mape:0.339101+0.000441 \n",
      "[94]\ttrain-mape:0.335705+0.000223\ttest-mape:0.335688+0.000395 \n",
      "[95]\ttrain-mape:0.332358+0.000238\ttest-mape:0.332341+0.000408 \n",
      "[96]\ttrain-mape:0.329026+0.000218\ttest-mape:0.329012+0.000381 \n",
      "[97]\ttrain-mape:0.325729+0.000201\ttest-mape:0.325717+0.000355 \n",
      "[98]\ttrain-mape:0.322492+0.000200\ttest-mape:0.322482+0.000345 \n",
      "[99]\ttrain-mape:0.319299+0.000214\ttest-mape:0.319289+0.000345 \n",
      "[100]\ttrain-mape:0.316118+0.000227\ttest-mape:0.316112+0.000357 \n",
      "[101]\ttrain-mape:0.312995+0.000259\ttest-mape:0.312987+0.000368 \n",
      "[102]\ttrain-mape:0.309875+0.000271\ttest-mape:0.309867+0.000365 \n",
      "[103]\ttrain-mape:0.306823+0.000294\ttest-mape:0.306813+0.000365 \n",
      "[104]\ttrain-mape:0.303822+0.000333\ttest-mape:0.303810+0.000385 \n",
      "[105]\ttrain-mape:0.300828+0.000332\ttest-mape:0.300819+0.000385 \n",
      "[106]\ttrain-mape:0.297906+0.000383\ttest-mape:0.297894+0.000418 \n",
      "[107]\ttrain-mape:0.295004+0.000380\ttest-mape:0.294997+0.000417 \n",
      "[108]\ttrain-mape:0.292187+0.000448\ttest-mape:0.292176+0.000461 \n",
      "[109]\ttrain-mape:0.289357+0.000459\ttest-mape:0.289348+0.000474 \n",
      "[110]\ttrain-mape:0.286531+0.000451\ttest-mape:0.286528+0.000442 \n",
      "[111]\ttrain-mape:0.283750+0.000465\ttest-mape:0.283751+0.000471 \n",
      "[112]\ttrain-mape:0.281035+0.000488\ttest-mape:0.281038+0.000503 \n",
      "[113]\ttrain-mape:0.278374+0.000555\ttest-mape:0.278379+0.000575 \n",
      "[114]\ttrain-mape:0.275740+0.000590\ttest-mape:0.275747+0.000615 \n",
      "[115]\ttrain-mape:0.273114+0.000686\ttest-mape:0.273121+0.000718 \n",
      "[116]\ttrain-mape:0.270540+0.000722\ttest-mape:0.270546+0.000719 \n",
      "[117]\ttrain-mape:0.267997+0.000844\ttest-mape:0.268003+0.000850 \n",
      "[118]\ttrain-mape:0.265430+0.000892\ttest-mape:0.265429+0.000885 \n",
      "[119]\ttrain-mape:0.262961+0.000925\ttest-mape:0.262954+0.000888 \n",
      "[120]\ttrain-mape:0.260458+0.000908\ttest-mape:0.260451+0.000864 \n",
      "[121]\ttrain-mape:0.258037+0.000982\ttest-mape:0.258032+0.000945 \n",
      "[122]\ttrain-mape:0.255576+0.001088\ttest-mape:0.255564+0.001026 \n",
      "[123]\ttrain-mape:0.253229+0.001188\ttest-mape:0.253210+0.001095 \n",
      "[124]\ttrain-mape:0.250887+0.001187\ttest-mape:0.250870+0.001107 \n",
      "[125]\ttrain-mape:0.248567+0.001197\ttest-mape:0.248554+0.001128 \n",
      "[126]\ttrain-mape:0.246283+0.001331\ttest-mape:0.246266+0.001238 \n",
      "[127]\ttrain-mape:0.243981+0.001379\ttest-mape:0.243969+0.001303 \n",
      "[128]\ttrain-mape:0.241803+0.001371\ttest-mape:0.241799+0.001300 \n",
      "[129]\ttrain-mape:0.239718+0.001515\ttest-mape:0.239716+0.001447 \n",
      "[130]\ttrain-mape:0.237502+0.001543\ttest-mape:0.237506+0.001472 \n",
      "[131]\ttrain-mape:0.235370+0.001595\ttest-mape:0.235378+0.001545 \n",
      "[132]\ttrain-mape:0.233187+0.001615\ttest-mape:0.233200+0.001564 \n",
      "[133]\ttrain-mape:0.230991+0.001512\ttest-mape:0.231008+0.001460 \n",
      "[134]\ttrain-mape:0.229058+0.001571\ttest-mape:0.229078+0.001516 \n",
      "[135]\ttrain-mape:0.227061+0.001758\ttest-mape:0.227079+0.001702 \n",
      "[136]\ttrain-mape:0.224951+0.001868\ttest-mape:0.224973+0.001816 \n",
      "[137]\ttrain-mape:0.223046+0.001926\ttest-mape:0.223075+0.001891 \n",
      "[138]\ttrain-mape:0.220997+0.001882\ttest-mape:0.221022+0.001826 \n",
      "[139]\ttrain-mape:0.218870+0.001786\ttest-mape:0.218897+0.001728 \n",
      "[140]\ttrain-mape:0.216932+0.001699\ttest-mape:0.216961+0.001660 \n",
      "[141]\ttrain-mape:0.215085+0.001905\ttest-mape:0.215113+0.001863 \n",
      "[142]\ttrain-mape:0.213268+0.002113\ttest-mape:0.213297+0.002074 \n",
      "[143]\ttrain-mape:0.211414+0.002115\ttest-mape:0.211448+0.002081 \n",
      "[144]\ttrain-mape:0.209605+0.002197\ttest-mape:0.209644+0.002182 \n",
      "[145]\ttrain-mape:0.207730+0.002315\ttest-mape:0.207772+0.002307 \n",
      "[146]\ttrain-mape:0.205885+0.002356\ttest-mape:0.205924+0.002340 \n",
      "[147]\ttrain-mape:0.204118+0.002459\ttest-mape:0.204159+0.002457 \n",
      "[148]\ttrain-mape:0.202197+0.002369\ttest-mape:0.202239+0.002366 \n",
      "[149]\ttrain-mape:0.200454+0.002564\ttest-mape:0.200498+0.002578 \n",
      "[150]\ttrain-mape:0.198662+0.002464\ttest-mape:0.198704+0.002464 \n",
      "[151]\ttrain-mape:0.197125+0.002640\ttest-mape:0.197167+0.002640 \n",
      "[152]\ttrain-mape:0.195556+0.002539\ttest-mape:0.195598+0.002539 \n",
      "[153]\ttrain-mape:0.193830+0.002631\ttest-mape:0.193871+0.002635 \n",
      "[154]\ttrain-mape:0.192239+0.002710\ttest-mape:0.192281+0.002705 \n",
      "[155]\ttrain-mape:0.190540+0.002678\ttest-mape:0.190580+0.002659 \n",
      "[156]\ttrain-mape:0.188833+0.002649\ttest-mape:0.188872+0.002620 \n",
      "[157]\ttrain-mape:0.187361+0.002602\ttest-mape:0.187400+0.002573 \n",
      "[158]\ttrain-mape:0.185584+0.002464\ttest-mape:0.185624+0.002434 \n",
      "[159]\ttrain-mape:0.183973+0.002468\ttest-mape:0.184018+0.002445 \n",
      "[160]\ttrain-mape:0.182574+0.002468\ttest-mape:0.182621+0.002465 \n",
      "[161]\ttrain-mape:0.181089+0.002451\ttest-mape:0.181136+0.002443 \n",
      "[162]\ttrain-mape:0.179416+0.002482\ttest-mape:0.179464+0.002488 \n",
      "[163]\ttrain-mape:0.177785+0.002540\ttest-mape:0.177834+0.002528 \n",
      "[164]\ttrain-mape:0.176251+0.002526\ttest-mape:0.176299+0.002497 \n",
      "[165]\ttrain-mape:0.174957+0.002738\ttest-mape:0.175006+0.002715 \n",
      "[166]\ttrain-mape:0.173624+0.002737\ttest-mape:0.173675+0.002698 \n",
      "[167]\ttrain-mape:0.172334+0.002735\ttest-mape:0.172385+0.002680 \n",
      "[168]\ttrain-mape:0.170896+0.002884\ttest-mape:0.170950+0.002850 \n",
      "[169]\ttrain-mape:0.169536+0.002761\ttest-mape:0.169589+0.002731 \n",
      "[170]\ttrain-mape:0.168223+0.002990\ttest-mape:0.168277+0.002961 \n",
      "[171]\ttrain-mape:0.166857+0.003006\ttest-mape:0.166913+0.002973 \n",
      "[172]\ttrain-mape:0.165451+0.002993\ttest-mape:0.165508+0.002947 \n",
      "[173]\ttrain-mape:0.164240+0.002969\ttest-mape:0.164297+0.002925 \n",
      "[174]\ttrain-mape:0.162845+0.002914\ttest-mape:0.162901+0.002876 \n",
      "[175]\ttrain-mape:0.161371+0.003025\ttest-mape:0.161427+0.002976 \n",
      "[176]\ttrain-mape:0.160004+0.003097\ttest-mape:0.160058+0.003034 \n",
      "[177]\ttrain-mape:0.158553+0.003146\ttest-mape:0.158609+0.003090 \n",
      "[178]\ttrain-mape:0.157366+0.003304\ttest-mape:0.157419+0.003239 \n",
      "[179]\ttrain-mape:0.155905+0.003146\ttest-mape:0.155958+0.003084 \n",
      "[180]\ttrain-mape:0.154575+0.003234\ttest-mape:0.154629+0.003188 \n",
      "[181]\ttrain-mape:0.153146+0.003119\ttest-mape:0.153198+0.003069 \n",
      "[182]\ttrain-mape:0.151990+0.003213\ttest-mape:0.152041+0.003158 \n",
      "[183]\ttrain-mape:0.150697+0.003344\ttest-mape:0.150750+0.003290 \n",
      "[184]\ttrain-mape:0.149571+0.003414\ttest-mape:0.149624+0.003360 \n",
      "[185]\ttrain-mape:0.148287+0.003285\ttest-mape:0.148341+0.003244 \n",
      "[186]\ttrain-mape:0.147025+0.003157\ttest-mape:0.147081+0.003130 \n",
      "[187]\ttrain-mape:0.146093+0.003117\ttest-mape:0.146149+0.003098 \n",
      "[188]\ttrain-mape:0.144877+0.003269\ttest-mape:0.144934+0.003248 \n",
      "[189]\ttrain-mape:0.143908+0.003464\ttest-mape:0.143966+0.003450 \n",
      "[190]\ttrain-mape:0.142842+0.003441\ttest-mape:0.142901+0.003447 \n",
      "[191]\ttrain-mape:0.141627+0.003175\ttest-mape:0.141684+0.003179 \n",
      "[192]\ttrain-mape:0.140559+0.002963\ttest-mape:0.140615+0.002979 \n",
      "[193]\ttrain-mape:0.139467+0.002752\ttest-mape:0.139521+0.002769 \n",
      "[194]\ttrain-mape:0.138317+0.002773\ttest-mape:0.138368+0.002772 \n",
      "[195]\ttrain-mape:0.136947+0.002748\ttest-mape:0.136999+0.002748 \n",
      "[196]\ttrain-mape:0.135912+0.002526\ttest-mape:0.135962+0.002533 \n",
      "[197]\ttrain-mape:0.134700+0.002595\ttest-mape:0.134751+0.002610 \n",
      "[198]\ttrain-mape:0.133744+0.002855\ttest-mape:0.133797+0.002878 \n",
      "[199]\ttrain-mape:0.132752+0.002659\ttest-mape:0.132805+0.002692 \n",
      "[200]\ttrain-mape:0.131747+0.002783\ttest-mape:0.131800+0.002813 \n",
      "[201]\ttrain-mape:0.130858+0.002981\ttest-mape:0.130911+0.003009 \n",
      "[202]\ttrain-mape:0.129791+0.003043\ttest-mape:0.129843+0.003055 \n",
      "[203]\ttrain-mape:0.128895+0.003305\ttest-mape:0.128948+0.003325 \n",
      "[204]\ttrain-mape:0.128189+0.003354\ttest-mape:0.128242+0.003373 \n",
      "[205]\ttrain-mape:0.127112+0.003209\ttest-mape:0.127166+0.003239 \n",
      "[206]\ttrain-mape:0.126075+0.003366\ttest-mape:0.126130+0.003391 \n",
      "[207]\ttrain-mape:0.125039+0.003095\ttest-mape:0.125092+0.003114 \n",
      "[208]\ttrain-mape:0.123999+0.003162\ttest-mape:0.124053+0.003195 \n",
      "[209]\ttrain-mape:0.123077+0.003138\ttest-mape:0.123132+0.003178 \n",
      "[210]\ttrain-mape:0.121987+0.003165\ttest-mape:0.122043+0.003209 \n",
      "[211]\ttrain-mape:0.120970+0.003034\ttest-mape:0.121026+0.003083 \n",
      "[212]\ttrain-mape:0.120124+0.003017\ttest-mape:0.120182+0.003083 \n",
      "[213]\ttrain-mape:0.119029+0.003041\ttest-mape:0.119085+0.003114 \n",
      "[214]\ttrain-mape:0.118027+0.003136\ttest-mape:0.118083+0.003217 \n",
      "[215]\ttrain-mape:0.117090+0.003292\ttest-mape:0.117147+0.003383 \n",
      "[216]\ttrain-mape:0.116134+0.003257\ttest-mape:0.116189+0.003343 \n",
      "[217]\ttrain-mape:0.114989+0.003217\ttest-mape:0.115043+0.003303 \n",
      "[218]\ttrain-mape:0.113981+0.003292\ttest-mape:0.114036+0.003388 \n",
      "[219]\ttrain-mape:0.112923+0.003158\ttest-mape:0.112980+0.003256 \n",
      "[220]\ttrain-mape:0.112044+0.003294\ttest-mape:0.112102+0.003385 \n",
      "[221]\ttrain-mape:0.111128+0.003426\ttest-mape:0.111186+0.003522 \n",
      "[222]\ttrain-mape:0.110302+0.003443\ttest-mape:0.110361+0.003548 \n",
      "[223]\ttrain-mape:0.109298+0.003292\ttest-mape:0.109359+0.003403 \n",
      "[224]\ttrain-mape:0.108521+0.003351\ttest-mape:0.108583+0.003473 \n",
      "[225]\ttrain-mape:0.107719+0.003317\ttest-mape:0.107779+0.003435 \n",
      "[226]\ttrain-mape:0.106827+0.003075\ttest-mape:0.106887+0.003196 \n",
      "[227]\ttrain-mape:0.106095+0.003299\ttest-mape:0.106156+0.003418 \n",
      "[228]\ttrain-mape:0.105305+0.003149\ttest-mape:0.105367+0.003265 \n",
      "[229]\ttrain-mape:0.104458+0.003139\ttest-mape:0.104522+0.003266 \n",
      "[230]\ttrain-mape:0.103543+0.003160\ttest-mape:0.103608+0.003283 \n",
      "[231]\ttrain-mape:0.102897+0.003260\ttest-mape:0.102961+0.003380 \n",
      "[232]\ttrain-mape:0.102098+0.003246\ttest-mape:0.102161+0.003368 \n",
      "[233]\ttrain-mape:0.101469+0.003225\ttest-mape:0.101532+0.003353 \n",
      "[234]\ttrain-mape:0.100551+0.003089\ttest-mape:0.100615+0.003222 \n",
      "[235]\ttrain-mape:0.099803+0.002894\ttest-mape:0.099866+0.003026 \n",
      "[236]\ttrain-mape:0.098911+0.002760\ttest-mape:0.098972+0.002887 \n",
      "[237]\ttrain-mape:0.098116+0.002846\ttest-mape:0.098177+0.002968 \n",
      "[238]\ttrain-mape:0.097226+0.002714\ttest-mape:0.097287+0.002842 \n",
      "[239]\ttrain-mape:0.096271+0.002684\ttest-mape:0.096332+0.002812 \n",
      "[240]\ttrain-mape:0.095508+0.002628\ttest-mape:0.095571+0.002756 \n",
      "[241]\ttrain-mape:0.094665+0.002489\ttest-mape:0.094728+0.002624 \n",
      "[242]\ttrain-mape:0.094013+0.002522\ttest-mape:0.094077+0.002657 \n",
      "[243]\ttrain-mape:0.093249+0.002450\ttest-mape:0.093312+0.002585 \n",
      "[244]\ttrain-mape:0.092518+0.002586\ttest-mape:0.092581+0.002725 \n",
      "[245]\ttrain-mape:0.091889+0.002784\ttest-mape:0.091953+0.002921 \n",
      "[246]\ttrain-mape:0.091284+0.002836\ttest-mape:0.091347+0.002969 \n",
      "[247]\ttrain-mape:0.090633+0.002709\ttest-mape:0.090696+0.002843 \n",
      "[248]\ttrain-mape:0.090098+0.002673\ttest-mape:0.090161+0.002813 \n",
      "[249]\ttrain-mape:0.089406+0.002594\ttest-mape:0.089471+0.002738 \n",
      "[250]\ttrain-mape:0.088701+0.002532\ttest-mape:0.088765+0.002668 \n",
      "[251]\ttrain-mape:0.087988+0.002617\ttest-mape:0.088052+0.002748 \n",
      "[252]\ttrain-mape:0.087210+0.002493\ttest-mape:0.087275+0.002631 \n",
      "[253]\ttrain-mape:0.086560+0.002634\ttest-mape:0.086625+0.002775 \n",
      "[254]\ttrain-mape:0.085943+0.002672\ttest-mape:0.086009+0.002811 \n",
      "[255]\ttrain-mape:0.085449+0.002572\ttest-mape:0.085515+0.002716 \n",
      "[256]\ttrain-mape:0.084974+0.002485\ttest-mape:0.085040+0.002624 \n",
      "[257]\ttrain-mape:0.084403+0.002409\ttest-mape:0.084469+0.002549 \n",
      "[258]\ttrain-mape:0.083741+0.002415\ttest-mape:0.083806+0.002545 \n",
      "[259]\ttrain-mape:0.083158+0.002419\ttest-mape:0.083222+0.002543 \n",
      "[260]\ttrain-mape:0.082349+0.002387\ttest-mape:0.082412+0.002510 \n",
      "[261]\ttrain-mape:0.081612+0.002435\ttest-mape:0.081675+0.002555 \n",
      "[262]\ttrain-mape:0.080904+0.002311\ttest-mape:0.080967+0.002438 \n",
      "[263]\ttrain-mape:0.080204+0.002347\ttest-mape:0.080268+0.002479 \n",
      "[264]\ttrain-mape:0.079643+0.002182\ttest-mape:0.079707+0.002314 \n",
      "[265]\ttrain-mape:0.079031+0.002134\ttest-mape:0.079094+0.002263 \n",
      "[266]\ttrain-mape:0.078472+0.001998\ttest-mape:0.078535+0.002125 \n",
      "[267]\ttrain-mape:0.077869+0.001935\ttest-mape:0.077932+0.002068 \n",
      "[268]\ttrain-mape:0.077283+0.002030\ttest-mape:0.077348+0.002169 \n",
      "[269]\ttrain-mape:0.076797+0.002213\ttest-mape:0.076863+0.002351 \n",
      "[270]\ttrain-mape:0.076192+0.002204\ttest-mape:0.076259+0.002351 \n",
      "[271]\ttrain-mape:0.075545+0.002236\ttest-mape:0.075612+0.002381 \n",
      "[272]\ttrain-mape:0.075119+0.002151\ttest-mape:0.075186+0.002301 \n",
      "[273]\ttrain-mape:0.074642+0.002196\ttest-mape:0.074711+0.002354 \n",
      "[274]\ttrain-mape:0.074140+0.002221\ttest-mape:0.074210+0.002380 \n",
      "[275]\ttrain-mape:0.073729+0.002222\ttest-mape:0.073798+0.002386 \n",
      "[276]\ttrain-mape:0.073130+0.002172\ttest-mape:0.073200+0.002341 \n",
      "[277]\ttrain-mape:0.072652+0.002144\ttest-mape:0.072721+0.002305 \n",
      "[278]\ttrain-mape:0.072048+0.002197\ttest-mape:0.072117+0.002360 \n",
      "[279]\ttrain-mape:0.071422+0.002071\ttest-mape:0.071490+0.002230 \n",
      "[280]\ttrain-mape:0.071034+0.002022\ttest-mape:0.071103+0.002177 \n",
      "[281]\ttrain-mape:0.070424+0.001907\ttest-mape:0.070492+0.002057 \n",
      "[282]\ttrain-mape:0.069905+0.002010\ttest-mape:0.069974+0.002160 \n",
      "[283]\ttrain-mape:0.069617+0.002002\ttest-mape:0.069686+0.002153 \n",
      "[284]\ttrain-mape:0.069010+0.001917\ttest-mape:0.069081+0.002075 \n",
      "[285]\ttrain-mape:0.068428+0.001819\ttest-mape:0.068500+0.001984 \n",
      "[286]\ttrain-mape:0.068040+0.001773\ttest-mape:0.068112+0.001940 \n",
      "[287]\ttrain-mape:0.067517+0.001860\ttest-mape:0.067588+0.002025 \n",
      "[288]\ttrain-mape:0.067174+0.001929\ttest-mape:0.067245+0.002085 \n",
      "[289]\ttrain-mape:0.066610+0.001947\ttest-mape:0.066681+0.002101 \n",
      "[290]\ttrain-mape:0.066126+0.001939\ttest-mape:0.066197+0.002096 \n",
      "[291]\ttrain-mape:0.065566+0.001974\ttest-mape:0.065638+0.002129 \n",
      "[292]\ttrain-mape:0.065157+0.001870\ttest-mape:0.065228+0.002024 \n",
      "[293]\ttrain-mape:0.064686+0.001948\ttest-mape:0.064757+0.002103 \n",
      "[294]\ttrain-mape:0.064280+0.001968\ttest-mape:0.064351+0.002117 \n",
      "[295]\ttrain-mape:0.063840+0.001937\ttest-mape:0.063911+0.002094 \n",
      "[296]\ttrain-mape:0.063308+0.001844\ttest-mape:0.063381+0.002007 \n",
      "[297]\ttrain-mape:0.062777+0.001761\ttest-mape:0.062850+0.001930 \n",
      "[298]\ttrain-mape:0.062327+0.001859\ttest-mape:0.062400+0.002021 \n",
      "[299]\ttrain-mape:0.061931+0.001849\ttest-mape:0.062003+0.002006 \n",
      "[300]\ttrain-mape:0.061350+0.001828\ttest-mape:0.061422+0.001983 \n",
      "[301]\ttrain-mape:0.060949+0.001745\ttest-mape:0.061021+0.001901 \n",
      "[302]\ttrain-mape:0.060490+0.001847\ttest-mape:0.060562+0.001996 \n",
      "[303]\ttrain-mape:0.060181+0.001924\ttest-mape:0.060253+0.002068 \n",
      "[304]\ttrain-mape:0.059801+0.001949\ttest-mape:0.059874+0.002100 \n",
      "[305]\ttrain-mape:0.059447+0.001992\ttest-mape:0.059521+0.002147 \n",
      "[306]\ttrain-mape:0.058882+0.001960\ttest-mape:0.058957+0.002115 \n",
      "[307]\ttrain-mape:0.058336+0.001936\ttest-mape:0.058411+0.002089 \n",
      "[308]\ttrain-mape:0.057906+0.001914\ttest-mape:0.057981+0.002060 \n",
      "[309]\ttrain-mape:0.057459+0.001788\ttest-mape:0.057532+0.001934 \n",
      "[310]\ttrain-mape:0.056985+0.001718\ttest-mape:0.057060+0.001870 \n",
      "[311]\ttrain-mape:0.056546+0.001796\ttest-mape:0.056621+0.001946 \n",
      "[312]\ttrain-mape:0.056076+0.001687\ttest-mape:0.056151+0.001831 \n",
      "[313]\ttrain-mape:0.055727+0.001698\ttest-mape:0.055800+0.001833 \n",
      "[314]\ttrain-mape:0.055393+0.001721\ttest-mape:0.055467+0.001847 \n",
      "[315]\ttrain-mape:0.055001+0.001576\ttest-mape:0.055076+0.001701 \n",
      "[316]\ttrain-mape:0.054797+0.001589\ttest-mape:0.054872+0.001714 \n",
      "[317]\ttrain-mape:0.054339+0.001595\ttest-mape:0.054414+0.001724 \n",
      "[318]\ttrain-mape:0.053945+0.001535\ttest-mape:0.054019+0.001661 \n",
      "[319]\ttrain-mape:0.053666+0.001532\ttest-mape:0.053740+0.001655 \n",
      "[320]\ttrain-mape:0.053226+0.001455\ttest-mape:0.053300+0.001568 \n",
      "[321]\ttrain-mape:0.052795+0.001533\ttest-mape:0.052868+0.001642 \n",
      "[322]\ttrain-mape:0.052463+0.001584\ttest-mape:0.052535+0.001684 \n",
      "[323]\ttrain-mape:0.052155+0.001481\ttest-mape:0.052227+0.001579 \n",
      "[324]\ttrain-mape:0.051738+0.001458\ttest-mape:0.051811+0.001561 \n",
      "[325]\ttrain-mape:0.051374+0.001464\ttest-mape:0.051447+0.001565 \n",
      "[326]\ttrain-mape:0.051113+0.001367\ttest-mape:0.051187+0.001469 \n",
      "[327]\ttrain-mape:0.050751+0.001429\ttest-mape:0.050826+0.001532 \n",
      "[328]\ttrain-mape:0.050396+0.001468\ttest-mape:0.050471+0.001579 \n",
      "[329]\ttrain-mape:0.050101+0.001457\ttest-mape:0.050176+0.001563 \n",
      "[330]\ttrain-mape:0.049754+0.001561\ttest-mape:0.049829+0.001666 \n",
      "[331]\ttrain-mape:0.049462+0.001603\ttest-mape:0.049539+0.001711 \n",
      "[332]\ttrain-mape:0.049126+0.001704\ttest-mape:0.049204+0.001810 \n",
      "[333]\ttrain-mape:0.048837+0.001641\ttest-mape:0.048914+0.001741 \n",
      "[334]\ttrain-mape:0.048392+0.001622\ttest-mape:0.048470+0.001719 \n",
      "[335]\ttrain-mape:0.048012+0.001690\ttest-mape:0.048089+0.001785 \n",
      "[336]\ttrain-mape:0.047674+0.001696\ttest-mape:0.047752+0.001783 \n",
      "[337]\ttrain-mape:0.047249+0.001680\ttest-mape:0.047327+0.001764 \n",
      "[338]\ttrain-mape:0.047012+0.001713\ttest-mape:0.047092+0.001805 \n",
      "[339]\ttrain-mape:0.046679+0.001719\ttest-mape:0.046757+0.001801 \n",
      "[340]\ttrain-mape:0.046412+0.001765\ttest-mape:0.046491+0.001850 \n",
      "[341]\ttrain-mape:0.046040+0.001713\ttest-mape:0.046119+0.001790 \n",
      "[342]\ttrain-mape:0.045768+0.001684\ttest-mape:0.045846+0.001760 \n",
      "[343]\ttrain-mape:0.045446+0.001580\ttest-mape:0.045525+0.001651 \n",
      "[344]\ttrain-mape:0.045086+0.001538\ttest-mape:0.045164+0.001601 \n",
      "[345]\ttrain-mape:0.044807+0.001463\ttest-mape:0.044885+0.001523 \n",
      "[346]\ttrain-mape:0.044413+0.001435\ttest-mape:0.044491+0.001493 \n",
      "[347]\ttrain-mape:0.044109+0.001481\ttest-mape:0.044188+0.001543 \n",
      "[348]\ttrain-mape:0.043912+0.001517\ttest-mape:0.043990+0.001574 \n",
      "[349]\ttrain-mape:0.043605+0.001532\ttest-mape:0.043684+0.001596 \n",
      "[350]\ttrain-mape:0.043387+0.001532\ttest-mape:0.043468+0.001602 \n",
      "[351]\ttrain-mape:0.043176+0.001477\ttest-mape:0.043257+0.001549 \n",
      "[352]\ttrain-mape:0.042932+0.001557\ttest-mape:0.043014+0.001633 \n",
      "[353]\ttrain-mape:0.042663+0.001574\ttest-mape:0.042744+0.001643 \n",
      "[354]\ttrain-mape:0.042458+0.001545\ttest-mape:0.042539+0.001608 \n",
      "[355]\ttrain-mape:0.042223+0.001535\ttest-mape:0.042305+0.001590 \n",
      "[356]\ttrain-mape:0.042004+0.001467\ttest-mape:0.042086+0.001531 \n",
      "[357]\ttrain-mape:0.041758+0.001458\ttest-mape:0.041840+0.001515 \n",
      "[358]\ttrain-mape:0.041427+0.001524\ttest-mape:0.041508+0.001578 \n",
      "[359]\ttrain-mape:0.041181+0.001498\ttest-mape:0.041262+0.001551 \n",
      "[360]\ttrain-mape:0.040865+0.001477\ttest-mape:0.040947+0.001532 \n",
      "[361]\ttrain-mape:0.040533+0.001403\ttest-mape:0.040616+0.001460 \n",
      "[362]\ttrain-mape:0.040263+0.001363\ttest-mape:0.040346+0.001417 \n",
      "[363]\ttrain-mape:0.040046+0.001384\ttest-mape:0.040129+0.001441 \n",
      "[364]\ttrain-mape:0.039806+0.001396\ttest-mape:0.039890+0.001459 \n",
      "[365]\ttrain-mape:0.039487+0.001412\ttest-mape:0.039571+0.001476 \n",
      "[366]\ttrain-mape:0.039238+0.001478\ttest-mape:0.039322+0.001544 \n",
      "[367]\ttrain-mape:0.038951+0.001540\ttest-mape:0.039036+0.001604 \n",
      "[368]\ttrain-mape:0.038745+0.001470\ttest-mape:0.038830+0.001529 \n",
      "[369]\ttrain-mape:0.038480+0.001421\ttest-mape:0.038564+0.001478 \n",
      "[370]\ttrain-mape:0.038243+0.001375\ttest-mape:0.038328+0.001436 \n",
      "[371]\ttrain-mape:0.037962+0.001442\ttest-mape:0.038047+0.001501 \n",
      "[372]\ttrain-mape:0.037753+0.001376\ttest-mape:0.037838+0.001429 \n",
      "[373]\ttrain-mape:0.037555+0.001452\ttest-mape:0.037641+0.001508 \n",
      "[374]\ttrain-mape:0.037306+0.001431\ttest-mape:0.037392+0.001491 \n",
      "[375]\ttrain-mape:0.037085+0.001431\ttest-mape:0.037172+0.001491 \n",
      "[376]\ttrain-mape:0.036893+0.001362\ttest-mape:0.036980+0.001419 \n",
      "[377]\ttrain-mape:0.036655+0.001371\ttest-mape:0.036741+0.001435 \n",
      "[378]\ttrain-mape:0.036447+0.001341\ttest-mape:0.036533+0.001402 \n",
      "[379]\ttrain-mape:0.036180+0.001358\ttest-mape:0.036266+0.001422 \n",
      "[380]\ttrain-mape:0.035953+0.001267\ttest-mape:0.036039+0.001324 \n",
      "[381]\ttrain-mape:0.035714+0.001282\ttest-mape:0.035800+0.001345 \n",
      "[382]\ttrain-mape:0.035441+0.001321\ttest-mape:0.035527+0.001382 \n",
      "[383]\ttrain-mape:0.035253+0.001393\ttest-mape:0.035340+0.001459 \n",
      "[384]\ttrain-mape:0.034993+0.001397\ttest-mape:0.035079+0.001462 \n",
      "[385]\ttrain-mape:0.034784+0.001368\ttest-mape:0.034872+0.001438 \n",
      "[386]\ttrain-mape:0.034560+0.001368\ttest-mape:0.034648+0.001443 \n",
      "[387]\ttrain-mape:0.034382+0.001346\ttest-mape:0.034470+0.001428 \n",
      "[388]\ttrain-mape:0.034216+0.001379\ttest-mape:0.034305+0.001460 \n",
      "[389]\ttrain-mape:0.033966+0.001319\ttest-mape:0.034055+0.001402 \n",
      "[390]\ttrain-mape:0.033782+0.001389\ttest-mape:0.033871+0.001473 \n",
      "[391]\ttrain-mape:0.033573+0.001325\ttest-mape:0.033663+0.001413 \n",
      "[392]\ttrain-mape:0.033370+0.001267\ttest-mape:0.033460+0.001360 \n",
      "[393]\ttrain-mape:0.033129+0.001247\ttest-mape:0.033220+0.001342 \n",
      "[394]\ttrain-mape:0.032909+0.001178\ttest-mape:0.032999+0.001269 \n",
      "[395]\ttrain-mape:0.032765+0.001139\ttest-mape:0.032855+0.001232 \n",
      "[396]\ttrain-mape:0.032605+0.001201\ttest-mape:0.032695+0.001299 \n",
      "[397]\ttrain-mape:0.032405+0.001239\ttest-mape:0.032496+0.001337 \n",
      "[398]\ttrain-mape:0.032214+0.001269\ttest-mape:0.032305+0.001371 \n",
      "[399]\ttrain-mape:0.032054+0.001230\ttest-mape:0.032144+0.001329 \n",
      "[400]\ttrain-mape:0.031856+0.001231\ttest-mape:0.031946+0.001323 \n",
      "[401]\ttrain-mape:0.031732+0.001262\ttest-mape:0.031821+0.001351 \n",
      "[402]\ttrain-mape:0.031565+0.001276\ttest-mape:0.031655+0.001367 \n",
      "[403]\ttrain-mape:0.031419+0.001256\ttest-mape:0.031508+0.001344 \n",
      "[404]\ttrain-mape:0.031221+0.001187\ttest-mape:0.031310+0.001274 \n",
      "[405]\ttrain-mape:0.031044+0.001246\ttest-mape:0.031134+0.001329 \n",
      "[406]\ttrain-mape:0.030884+0.001216\ttest-mape:0.030973+0.001300 \n",
      "[407]\ttrain-mape:0.030760+0.001171\ttest-mape:0.030849+0.001258 \n",
      "[408]\ttrain-mape:0.030557+0.001154\ttest-mape:0.030647+0.001237 \n",
      "[409]\ttrain-mape:0.030382+0.001169\ttest-mape:0.030471+0.001257 \n",
      "[410]\ttrain-mape:0.030199+0.001181\ttest-mape:0.030288+0.001264 \n",
      "[411]\ttrain-mape:0.029988+0.001151\ttest-mape:0.030078+0.001236 \n",
      "[412]\ttrain-mape:0.029822+0.001169\ttest-mape:0.029913+0.001257 \n",
      "[413]\ttrain-mape:0.029709+0.001126\ttest-mape:0.029799+0.001214 \n",
      "[414]\ttrain-mape:0.029530+0.001166\ttest-mape:0.029621+0.001252 \n",
      "[415]\ttrain-mape:0.029352+0.001145\ttest-mape:0.029442+0.001231 \n",
      "[416]\ttrain-mape:0.029193+0.001150\ttest-mape:0.029283+0.001236 \n",
      "[417]\ttrain-mape:0.029037+0.001184\ttest-mape:0.029127+0.001271 \n",
      "[418]\ttrain-mape:0.028907+0.001245\ttest-mape:0.028998+0.001333 \n",
      "[419]\ttrain-mape:0.028685+0.001235\ttest-mape:0.028776+0.001322 \n",
      "[420]\ttrain-mape:0.028568+0.001243\ttest-mape:0.028660+0.001333 \n",
      "[421]\ttrain-mape:0.028370+0.001209\ttest-mape:0.028461+0.001296 \n",
      "[422]\ttrain-mape:0.028244+0.001203\ttest-mape:0.028335+0.001292 \n",
      "[423]\ttrain-mape:0.028080+0.001144\ttest-mape:0.028172+0.001231 \n",
      "[424]\ttrain-mape:0.027942+0.001158\ttest-mape:0.028032+0.001240 \n",
      "[425]\ttrain-mape:0.027751+0.001147\ttest-mape:0.027842+0.001233 \n",
      "[426]\ttrain-mape:0.027618+0.001120\ttest-mape:0.027709+0.001212 \n",
      "[427]\ttrain-mape:0.027446+0.001121\ttest-mape:0.027537+0.001213 \n",
      "[428]\ttrain-mape:0.027265+0.001126\ttest-mape:0.027356+0.001218 \n",
      "[429]\ttrain-mape:0.027136+0.001087\ttest-mape:0.027227+0.001180 \n",
      "[430]\ttrain-mape:0.027013+0.001112\ttest-mape:0.027104+0.001200 \n",
      "[431]\ttrain-mape:0.026876+0.001079\ttest-mape:0.026967+0.001171 \n",
      "[432]\ttrain-mape:0.026752+0.001090\ttest-mape:0.026843+0.001186 \n",
      "[433]\ttrain-mape:0.026636+0.001086\ttest-mape:0.026727+0.001186 \n",
      "[434]\ttrain-mape:0.026543+0.001049\ttest-mape:0.026635+0.001150 \n",
      "[435]\ttrain-mape:0.026374+0.001000\ttest-mape:0.026466+0.001102 \n",
      "[436]\ttrain-mape:0.026254+0.000992\ttest-mape:0.026346+0.001098 \n",
      "[437]\ttrain-mape:0.026132+0.000979\ttest-mape:0.026224+0.001085 \n",
      "[438]\ttrain-mape:0.026081+0.000978\ttest-mape:0.026174+0.001085 \n",
      "[439]\ttrain-mape:0.025909+0.000990\ttest-mape:0.026002+0.001099 \n",
      "[440]\ttrain-mape:0.025774+0.000971\ttest-mape:0.025867+0.001085 \n",
      "[441]\ttrain-mape:0.025672+0.000958\ttest-mape:0.025765+0.001072 \n",
      "[442]\ttrain-mape:0.025527+0.000984\ttest-mape:0.025620+0.001100 \n",
      "[443]\ttrain-mape:0.025450+0.000992\ttest-mape:0.025544+0.001110 \n",
      "[444]\ttrain-mape:0.025340+0.001044\ttest-mape:0.025433+0.001162 \n",
      "[445]\ttrain-mape:0.025248+0.001063\ttest-mape:0.025342+0.001182 \n",
      "[446]\ttrain-mape:0.025068+0.001039\ttest-mape:0.025162+0.001157 \n",
      "[447]\ttrain-mape:0.024894+0.001044\ttest-mape:0.024988+0.001162 \n",
      "[448]\ttrain-mape:0.024792+0.001043\ttest-mape:0.024887+0.001164 \n",
      "[449]\ttrain-mape:0.024679+0.001006\ttest-mape:0.024773+0.001131 \n",
      "[450]\ttrain-mape:0.024532+0.001016\ttest-mape:0.024627+0.001140 \n",
      "[451]\ttrain-mape:0.024421+0.000982\ttest-mape:0.024516+0.001108 \n",
      "[452]\ttrain-mape:0.024301+0.000995\ttest-mape:0.024396+0.001118 \n",
      "[453]\ttrain-mape:0.024173+0.000983\ttest-mape:0.024268+0.001102 \n",
      "[454]\ttrain-mape:0.024050+0.000917\ttest-mape:0.024145+0.001038 \n",
      "[455]\ttrain-mape:0.023991+0.000926\ttest-mape:0.024086+0.001045 \n",
      "[456]\ttrain-mape:0.023848+0.000900\ttest-mape:0.023942+0.001017 \n",
      "[457]\ttrain-mape:0.023785+0.000935\ttest-mape:0.023879+0.001052 \n",
      "[458]\ttrain-mape:0.023649+0.000947\ttest-mape:0.023744+0.001066 \n",
      "[459]\ttrain-mape:0.023550+0.000898\ttest-mape:0.023645+0.001017 \n",
      "[460]\ttrain-mape:0.023438+0.000924\ttest-mape:0.023532+0.001043 \n",
      "[461]\ttrain-mape:0.023297+0.000924\ttest-mape:0.023391+0.001040 \n",
      "[462]\ttrain-mape:0.023166+0.000932\ttest-mape:0.023260+0.001046 \n",
      "[463]\ttrain-mape:0.023061+0.000942\ttest-mape:0.023156+0.001054 \n",
      "[464]\ttrain-mape:0.023006+0.000968\ttest-mape:0.023101+0.001080 \n",
      "[465]\ttrain-mape:0.022913+0.000968\ttest-mape:0.023008+0.001080 \n",
      "[466]\ttrain-mape:0.022836+0.000937\ttest-mape:0.022931+0.001048 \n",
      "[467]\ttrain-mape:0.022765+0.000941\ttest-mape:0.022860+0.001052 \n",
      "[468]\ttrain-mape:0.022681+0.000940\ttest-mape:0.022777+0.001050 \n",
      "[469]\ttrain-mape:0.022618+0.000914\ttest-mape:0.022714+0.001025 \n",
      "[470]\ttrain-mape:0.022514+0.000891\ttest-mape:0.022610+0.001000 \n",
      "[471]\ttrain-mape:0.022429+0.000886\ttest-mape:0.022526+0.000997 \n",
      "[472]\ttrain-mape:0.022337+0.000857\ttest-mape:0.022434+0.000967 \n",
      "[473]\ttrain-mape:0.022213+0.000821\ttest-mape:0.022310+0.000931 \n",
      "[474]\ttrain-mape:0.022094+0.000825\ttest-mape:0.022191+0.000935 \n",
      "[475]\ttrain-mape:0.021998+0.000840\ttest-mape:0.022095+0.000952 \n",
      "[476]\ttrain-mape:0.021882+0.000844\ttest-mape:0.021979+0.000957 \n",
      "[477]\ttrain-mape:0.021771+0.000812\ttest-mape:0.021869+0.000927 \n",
      "[478]\ttrain-mape:0.021687+0.000767\ttest-mape:0.021784+0.000882 \n",
      "[479]\ttrain-mape:0.021586+0.000751\ttest-mape:0.021683+0.000867 \n",
      "[480]\ttrain-mape:0.021505+0.000755\ttest-mape:0.021601+0.000869 \n",
      "[481]\ttrain-mape:0.021410+0.000779\ttest-mape:0.021507+0.000893 \n",
      "[482]\ttrain-mape:0.021320+0.000804\ttest-mape:0.021416+0.000920 \n",
      "[483]\ttrain-mape:0.021221+0.000833\ttest-mape:0.021318+0.000948 \n",
      "[484]\ttrain-mape:0.021125+0.000844\ttest-mape:0.021221+0.000957 \n",
      "[485]\ttrain-mape:0.021069+0.000852\ttest-mape:0.021165+0.000964 \n",
      "[486]\ttrain-mape:0.020971+0.000855\ttest-mape:0.021068+0.000969 \n",
      "[487]\ttrain-mape:0.020860+0.000843\ttest-mape:0.020956+0.000956 \n",
      "[488]\ttrain-mape:0.020764+0.000839\ttest-mape:0.020860+0.000953 \n",
      "[489]\ttrain-mape:0.020706+0.000843\ttest-mape:0.020802+0.000958 \n",
      "[490]\ttrain-mape:0.020594+0.000818\ttest-mape:0.020690+0.000933 \n",
      "[491]\ttrain-mape:0.020527+0.000854\ttest-mape:0.020624+0.000969 \n",
      "[492]\ttrain-mape:0.020451+0.000817\ttest-mape:0.020547+0.000932 \n",
      "[493]\ttrain-mape:0.020364+0.000793\ttest-mape:0.020460+0.000906 \n",
      "[494]\ttrain-mape:0.020282+0.000784\ttest-mape:0.020379+0.000894 \n",
      "[495]\ttrain-mape:0.020203+0.000757\ttest-mape:0.020299+0.000869 \n",
      "[496]\ttrain-mape:0.020137+0.000733\ttest-mape:0.020233+0.000847 \n",
      "[497]\ttrain-mape:0.020054+0.000728\ttest-mape:0.020150+0.000840 \n",
      "[498]\ttrain-mape:0.020003+0.000736\ttest-mape:0.020099+0.000848 \n",
      "[499]\ttrain-mape:0.019936+0.000737\ttest-mape:0.020032+0.000850 \n",
      "[500]\ttrain-mape:0.019874+0.000716\ttest-mape:0.019970+0.000828 \n",
      "[501]\ttrain-mape:0.019773+0.000703\ttest-mape:0.019869+0.000814 \n",
      "[502]\ttrain-mape:0.019703+0.000703\ttest-mape:0.019799+0.000816 \n",
      "[503]\ttrain-mape:0.019647+0.000700\ttest-mape:0.019742+0.000808 \n",
      "[504]\ttrain-mape:0.019559+0.000716\ttest-mape:0.019655+0.000822 \n",
      "[505]\ttrain-mape:0.019460+0.000693\ttest-mape:0.019556+0.000800 \n",
      "[506]\ttrain-mape:0.019379+0.000696\ttest-mape:0.019474+0.000800 \n",
      "[507]\ttrain-mape:0.019304+0.000712\ttest-mape:0.019400+0.000813 \n",
      "[508]\ttrain-mape:0.019226+0.000699\ttest-mape:0.019321+0.000801 \n",
      "[509]\ttrain-mape:0.019134+0.000675\ttest-mape:0.019228+0.000775 \n",
      "[510]\ttrain-mape:0.019060+0.000640\ttest-mape:0.019154+0.000740 \n",
      "[511]\ttrain-mape:0.018979+0.000657\ttest-mape:0.019074+0.000755 \n",
      "[512]\ttrain-mape:0.018892+0.000667\ttest-mape:0.018986+0.000762 \n",
      "[513]\ttrain-mape:0.018814+0.000683\ttest-mape:0.018908+0.000779 \n",
      "[514]\ttrain-mape:0.018755+0.000700\ttest-mape:0.018849+0.000795 \n",
      "[515]\ttrain-mape:0.018697+0.000691\ttest-mape:0.018791+0.000787 \n",
      "[516]\ttrain-mape:0.018625+0.000699\ttest-mape:0.018718+0.000796 \n",
      "[517]\ttrain-mape:0.018551+0.000681\ttest-mape:0.018644+0.000777 \n",
      "[518]\ttrain-mape:0.018481+0.000672\ttest-mape:0.018573+0.000768 \n",
      "[519]\ttrain-mape:0.018427+0.000671\ttest-mape:0.018520+0.000769 \n",
      "[520]\ttrain-mape:0.018370+0.000695\ttest-mape:0.018463+0.000793 \n",
      "[521]\ttrain-mape:0.018303+0.000676\ttest-mape:0.018396+0.000776 \n",
      "[522]\ttrain-mape:0.018238+0.000656\ttest-mape:0.018331+0.000757 \n",
      "[523]\ttrain-mape:0.018201+0.000660\ttest-mape:0.018295+0.000762 \n",
      "[524]\ttrain-mape:0.018152+0.000656\ttest-mape:0.018246+0.000757 \n",
      "[525]\ttrain-mape:0.018088+0.000671\ttest-mape:0.018182+0.000771 \n",
      "[526]\ttrain-mape:0.018052+0.000682\ttest-mape:0.018146+0.000781 \n",
      "[527]\ttrain-mape:0.017967+0.000672\ttest-mape:0.018061+0.000770 \n",
      "[528]\ttrain-mape:0.017916+0.000653\ttest-mape:0.018010+0.000752 \n",
      "[529]\ttrain-mape:0.017852+0.000647\ttest-mape:0.017946+0.000747 \n",
      "[530]\ttrain-mape:0.017770+0.000641\ttest-mape:0.017864+0.000740 \n",
      "[531]\ttrain-mape:0.017711+0.000650\ttest-mape:0.017805+0.000750 \n",
      "[532]\ttrain-mape:0.017624+0.000642\ttest-mape:0.017719+0.000742 \n",
      "[533]\ttrain-mape:0.017543+0.000633\ttest-mape:0.017637+0.000732 \n",
      "[534]\ttrain-mape:0.017480+0.000632\ttest-mape:0.017575+0.000728 \n",
      "[535]\ttrain-mape:0.017431+0.000637\ttest-mape:0.017525+0.000733 \n",
      "[536]\ttrain-mape:0.017378+0.000622\ttest-mape:0.017472+0.000719 \n",
      "[537]\ttrain-mape:0.017341+0.000624\ttest-mape:0.017436+0.000722 \n",
      "[538]\ttrain-mape:0.017301+0.000632\ttest-mape:0.017395+0.000729 \n",
      "[539]\ttrain-mape:0.017240+0.000628\ttest-mape:0.017335+0.000723 \n",
      "[540]\ttrain-mape:0.017191+0.000626\ttest-mape:0.017285+0.000718 \n",
      "[541]\ttrain-mape:0.017156+0.000617\ttest-mape:0.017251+0.000707 \n",
      "[542]\ttrain-mape:0.017107+0.000620\ttest-mape:0.017201+0.000708 \n",
      "[543]\ttrain-mape:0.017072+0.000614\ttest-mape:0.017166+0.000699 \n",
      "[544]\ttrain-mape:0.017018+0.000614\ttest-mape:0.017112+0.000698 \n",
      "[545]\ttrain-mape:0.016977+0.000620\ttest-mape:0.017071+0.000704 \n",
      "[546]\ttrain-mape:0.016911+0.000627\ttest-mape:0.017005+0.000710 \n",
      "[547]\ttrain-mape:0.016877+0.000625\ttest-mape:0.016971+0.000709 \n",
      "[548]\ttrain-mape:0.016831+0.000624\ttest-mape:0.016926+0.000706 \n",
      "[549]\ttrain-mape:0.016768+0.000606\ttest-mape:0.016862+0.000688 \n",
      "[550]\ttrain-mape:0.016727+0.000601\ttest-mape:0.016821+0.000679 \n",
      "[551]\ttrain-mape:0.016677+0.000587\ttest-mape:0.016770+0.000666 \n",
      "[552]\ttrain-mape:0.016644+0.000605\ttest-mape:0.016737+0.000685 \n",
      "[553]\ttrain-mape:0.016602+0.000616\ttest-mape:0.016695+0.000696 \n",
      "[554]\ttrain-mape:0.016563+0.000616\ttest-mape:0.016656+0.000694 \n",
      "[555]\ttrain-mape:0.016505+0.000599\ttest-mape:0.016598+0.000678 \n",
      "[556]\ttrain-mape:0.016450+0.000574\ttest-mape:0.016543+0.000653 \n",
      "[557]\ttrain-mape:0.016400+0.000555\ttest-mape:0.016493+0.000634 \n",
      "[558]\ttrain-mape:0.016341+0.000537\ttest-mape:0.016434+0.000617 \n",
      "[559]\ttrain-mape:0.016306+0.000549\ttest-mape:0.016399+0.000630 \n",
      "[560]\ttrain-mape:0.016261+0.000567\ttest-mape:0.016354+0.000648 \n",
      "[561]\ttrain-mape:0.016217+0.000543\ttest-mape:0.016310+0.000623 \n",
      "[562]\ttrain-mape:0.016163+0.000531\ttest-mape:0.016256+0.000611 \n",
      "[563]\ttrain-mape:0.016124+0.000534\ttest-mape:0.016217+0.000612 \n",
      "[564]\ttrain-mape:0.016065+0.000514\ttest-mape:0.016158+0.000591 \n",
      "[565]\ttrain-mape:0.016023+0.000490\ttest-mape:0.016115+0.000567 \n",
      "[566]\ttrain-mape:0.015967+0.000485\ttest-mape:0.016060+0.000562 \n",
      "[567]\ttrain-mape:0.015935+0.000488\ttest-mape:0.016027+0.000564 \n",
      "[568]\ttrain-mape:0.015897+0.000497\ttest-mape:0.015989+0.000570 \n",
      "[569]\ttrain-mape:0.015841+0.000499\ttest-mape:0.015933+0.000575 \n",
      "[570]\ttrain-mape:0.015780+0.000491\ttest-mape:0.015872+0.000565 \n",
      "[571]\ttrain-mape:0.015747+0.000502\ttest-mape:0.015839+0.000576 \n",
      "[572]\ttrain-mape:0.015705+0.000490\ttest-mape:0.015796+0.000563 \n",
      "[573]\ttrain-mape:0.015649+0.000474\ttest-mape:0.015740+0.000548 \n",
      "[574]\ttrain-mape:0.015612+0.000462\ttest-mape:0.015704+0.000539 \n",
      "[575]\ttrain-mape:0.015566+0.000474\ttest-mape:0.015657+0.000549 \n",
      "[576]\ttrain-mape:0.015516+0.000449\ttest-mape:0.015608+0.000524 \n",
      "[577]\ttrain-mape:0.015480+0.000447\ttest-mape:0.015571+0.000525 \n",
      "[578]\ttrain-mape:0.015457+0.000453\ttest-mape:0.015548+0.000531 \n",
      "[579]\ttrain-mape:0.015432+0.000451\ttest-mape:0.015522+0.000527 \n",
      "[580]\ttrain-mape:0.015390+0.000464\ttest-mape:0.015480+0.000538 \n",
      "[581]\ttrain-mape:0.015358+0.000450\ttest-mape:0.015448+0.000526 \n",
      "[582]\ttrain-mape:0.015337+0.000449\ttest-mape:0.015427+0.000525 \n",
      "[583]\ttrain-mape:0.015304+0.000453\ttest-mape:0.015395+0.000526 \n",
      "[584]\ttrain-mape:0.015274+0.000460\ttest-mape:0.015365+0.000533 \n",
      "[585]\ttrain-mape:0.015241+0.000462\ttest-mape:0.015332+0.000535 \n",
      "[586]\ttrain-mape:0.015215+0.000478\ttest-mape:0.015306+0.000552 \n",
      "[587]\ttrain-mape:0.015186+0.000494\ttest-mape:0.015277+0.000568 \n",
      "[588]\ttrain-mape:0.015166+0.000498\ttest-mape:0.015256+0.000572 \n",
      "[589]\ttrain-mape:0.015129+0.000507\ttest-mape:0.015220+0.000580 \n",
      "[590]\ttrain-mape:0.015107+0.000494\ttest-mape:0.015197+0.000569 \n",
      "[591]\ttrain-mape:0.015068+0.000491\ttest-mape:0.015158+0.000563 \n",
      "[592]\ttrain-mape:0.015039+0.000489\ttest-mape:0.015130+0.000562 \n",
      "[593]\ttrain-mape:0.014998+0.000479\ttest-mape:0.015088+0.000554 \n",
      "[594]\ttrain-mape:0.014962+0.000471\ttest-mape:0.015052+0.000548 \n",
      "[595]\ttrain-mape:0.014916+0.000458\ttest-mape:0.015007+0.000536 \n",
      "[596]\ttrain-mape:0.014878+0.000455\ttest-mape:0.014969+0.000532 \n",
      "[597]\ttrain-mape:0.014840+0.000443\ttest-mape:0.014930+0.000519 \n",
      "[598]\ttrain-mape:0.014812+0.000441\ttest-mape:0.014902+0.000518 \n",
      "[599]\ttrain-mape:0.014793+0.000445\ttest-mape:0.014883+0.000522 \n",
      "[600]\ttrain-mape:0.014756+0.000450\ttest-mape:0.014846+0.000525 \n",
      "[601]\ttrain-mape:0.014720+0.000451\ttest-mape:0.014811+0.000524 \n",
      "[602]\ttrain-mape:0.014679+0.000439\ttest-mape:0.014769+0.000511 \n",
      "[603]\ttrain-mape:0.014649+0.000428\ttest-mape:0.014740+0.000501 \n",
      "[604]\ttrain-mape:0.014626+0.000435\ttest-mape:0.014716+0.000508 \n",
      "[605]\ttrain-mape:0.014593+0.000430\ttest-mape:0.014684+0.000504 \n",
      "[606]\ttrain-mape:0.014562+0.000426\ttest-mape:0.014652+0.000499 \n",
      "[607]\ttrain-mape:0.014529+0.000426\ttest-mape:0.014619+0.000497 \n",
      "[608]\ttrain-mape:0.014499+0.000434\ttest-mape:0.014589+0.000504 \n",
      "[609]\ttrain-mape:0.014476+0.000426\ttest-mape:0.014566+0.000495 \n",
      "[610]\ttrain-mape:0.014451+0.000419\ttest-mape:0.014541+0.000490 \n",
      "[611]\ttrain-mape:0.014426+0.000404\ttest-mape:0.014516+0.000474 \n",
      "[612]\ttrain-mape:0.014389+0.000392\ttest-mape:0.014478+0.000461 \n",
      "[613]\ttrain-mape:0.014364+0.000378\ttest-mape:0.014454+0.000446 \n",
      "[614]\ttrain-mape:0.014335+0.000371\ttest-mape:0.014424+0.000439 \n",
      "[615]\ttrain-mape:0.014306+0.000367\ttest-mape:0.014395+0.000433 \n",
      "[616]\ttrain-mape:0.014277+0.000365\ttest-mape:0.014366+0.000430 \n",
      "[617]\ttrain-mape:0.014245+0.000362\ttest-mape:0.014334+0.000428 \n",
      "[618]\ttrain-mape:0.014204+0.000358\ttest-mape:0.014293+0.000424 \n",
      "[619]\ttrain-mape:0.014186+0.000354\ttest-mape:0.014274+0.000417 \n",
      "[620]\ttrain-mape:0.014149+0.000355\ttest-mape:0.014237+0.000417 \n",
      "[621]\ttrain-mape:0.014123+0.000348\ttest-mape:0.014211+0.000408 \n",
      "[622]\ttrain-mape:0.014106+0.000350\ttest-mape:0.014194+0.000411 \n",
      "[623]\ttrain-mape:0.014083+0.000343\ttest-mape:0.014171+0.000405 \n",
      "[624]\ttrain-mape:0.014052+0.000340\ttest-mape:0.014140+0.000403 \n",
      "[625]\ttrain-mape:0.014032+0.000339\ttest-mape:0.014120+0.000401 \n",
      "[626]\ttrain-mape:0.014007+0.000345\ttest-mape:0.014095+0.000405 \n",
      "[627]\ttrain-mape:0.013982+0.000345\ttest-mape:0.014070+0.000404 \n",
      "[628]\ttrain-mape:0.013954+0.000345\ttest-mape:0.014041+0.000403 \n",
      "[629]\ttrain-mape:0.013939+0.000348\ttest-mape:0.014027+0.000406 \n",
      "[630]\ttrain-mape:0.013918+0.000351\ttest-mape:0.014005+0.000408 \n",
      "[631]\ttrain-mape:0.013893+0.000348\ttest-mape:0.013980+0.000404 \n",
      "[632]\ttrain-mape:0.013884+0.000348\ttest-mape:0.013972+0.000403 \n",
      "[633]\ttrain-mape:0.013860+0.000359\ttest-mape:0.013947+0.000414 \n",
      "[634]\ttrain-mape:0.013841+0.000356\ttest-mape:0.013928+0.000409 \n",
      "[635]\ttrain-mape:0.013818+0.000348\ttest-mape:0.013906+0.000401 \n",
      "[636]\ttrain-mape:0.013795+0.000352\ttest-mape:0.013882+0.000406 \n",
      "[637]\ttrain-mape:0.013765+0.000342\ttest-mape:0.013853+0.000396 \n",
      "[638]\ttrain-mape:0.013739+0.000339\ttest-mape:0.013826+0.000392 \n",
      "[639]\ttrain-mape:0.013725+0.000339\ttest-mape:0.013812+0.000392 \n",
      "[640]\ttrain-mape:0.013700+0.000336\ttest-mape:0.013787+0.000388 \n",
      "[641]\ttrain-mape:0.013687+0.000336\ttest-mape:0.013774+0.000388 \n",
      "[642]\ttrain-mape:0.013669+0.000335\ttest-mape:0.013756+0.000385 \n",
      "[643]\ttrain-mape:0.013651+0.000336\ttest-mape:0.013738+0.000386 \n",
      "[644]\ttrain-mape:0.013632+0.000340\ttest-mape:0.013719+0.000391 \n",
      "[645]\ttrain-mape:0.013606+0.000330\ttest-mape:0.013693+0.000380 \n",
      "[646]\ttrain-mape:0.013587+0.000333\ttest-mape:0.013675+0.000384 \n",
      "[647]\ttrain-mape:0.013553+0.000323\ttest-mape:0.013640+0.000373 \n",
      "[648]\ttrain-mape:0.013541+0.000322\ttest-mape:0.013628+0.000373 \n",
      "[649]\ttrain-mape:0.013520+0.000324\ttest-mape:0.013606+0.000374 \n",
      "[650]\ttrain-mape:0.013493+0.000320\ttest-mape:0.013580+0.000371 \n",
      "[651]\ttrain-mape:0.013476+0.000325\ttest-mape:0.013563+0.000375 \n",
      "[652]\ttrain-mape:0.013448+0.000325\ttest-mape:0.013535+0.000376 \n",
      "[653]\ttrain-mape:0.013432+0.000322\ttest-mape:0.013519+0.000373 \n",
      "[654]\ttrain-mape:0.013411+0.000322\ttest-mape:0.013498+0.000371 \n",
      "[655]\ttrain-mape:0.013386+0.000329\ttest-mape:0.013472+0.000377 \n",
      "[656]\ttrain-mape:0.013366+0.000333\ttest-mape:0.013452+0.000381 \n",
      "[657]\ttrain-mape:0.013345+0.000326\ttest-mape:0.013432+0.000374 \n",
      "[658]\ttrain-mape:0.013316+0.000320\ttest-mape:0.013402+0.000366 \n",
      "[659]\ttrain-mape:0.013289+0.000310\ttest-mape:0.013375+0.000356 \n",
      "[660]\ttrain-mape:0.013264+0.000309\ttest-mape:0.013350+0.000354 \n",
      "[661]\ttrain-mape:0.013240+0.000303\ttest-mape:0.013326+0.000348 \n",
      "[662]\ttrain-mape:0.013222+0.000304\ttest-mape:0.013308+0.000347 \n",
      "[663]\ttrain-mape:0.013202+0.000298\ttest-mape:0.013287+0.000343 \n",
      "[664]\ttrain-mape:0.013184+0.000305\ttest-mape:0.013270+0.000348 \n",
      "[665]\ttrain-mape:0.013160+0.000299\ttest-mape:0.013245+0.000344 \n",
      "[666]\ttrain-mape:0.013143+0.000289\ttest-mape:0.013228+0.000335 \n",
      "[667]\ttrain-mape:0.013119+0.000286\ttest-mape:0.013204+0.000331 \n",
      "[668]\ttrain-mape:0.013104+0.000290\ttest-mape:0.013190+0.000336 \n",
      "[669]\ttrain-mape:0.013088+0.000286\ttest-mape:0.013173+0.000333 \n",
      "[670]\ttrain-mape:0.013068+0.000279\ttest-mape:0.013152+0.000324 \n",
      "[671]\ttrain-mape:0.013047+0.000271\ttest-mape:0.013132+0.000318 \n",
      "[672]\ttrain-mape:0.013037+0.000268\ttest-mape:0.013122+0.000314 \n",
      "[673]\ttrain-mape:0.013024+0.000270\ttest-mape:0.013109+0.000316 \n",
      "[674]\ttrain-mape:0.013005+0.000275\ttest-mape:0.013090+0.000320 \n",
      "[675]\ttrain-mape:0.012993+0.000265\ttest-mape:0.013078+0.000312 \n",
      "[676]\ttrain-mape:0.012978+0.000263\ttest-mape:0.013062+0.000309 \n",
      "[677]\ttrain-mape:0.012954+0.000253\ttest-mape:0.013038+0.000299 \n",
      "[678]\ttrain-mape:0.012941+0.000253\ttest-mape:0.013025+0.000300 \n",
      "[679]\ttrain-mape:0.012927+0.000254\ttest-mape:0.013011+0.000301 \n",
      "[680]\ttrain-mape:0.012906+0.000249\ttest-mape:0.012991+0.000295 \n",
      "[681]\ttrain-mape:0.012888+0.000242\ttest-mape:0.012972+0.000287 \n",
      "[682]\ttrain-mape:0.012869+0.000246\ttest-mape:0.012953+0.000290 \n",
      "[683]\ttrain-mape:0.012856+0.000245\ttest-mape:0.012940+0.000289 \n",
      "[684]\ttrain-mape:0.012845+0.000245\ttest-mape:0.012929+0.000288 \n",
      "[685]\ttrain-mape:0.012828+0.000243\ttest-mape:0.012912+0.000285 \n",
      "[686]\ttrain-mape:0.012818+0.000243\ttest-mape:0.012902+0.000285 \n",
      "[687]\ttrain-mape:0.012808+0.000246\ttest-mape:0.012892+0.000287 \n",
      "[688]\ttrain-mape:0.012785+0.000237\ttest-mape:0.012868+0.000278 \n",
      "[689]\ttrain-mape:0.012777+0.000237\ttest-mape:0.012860+0.000277 \n",
      "[690]\ttrain-mape:0.012760+0.000231\ttest-mape:0.012843+0.000272 \n",
      "[691]\ttrain-mape:0.012744+0.000228\ttest-mape:0.012827+0.000270 \n",
      "[692]\ttrain-mape:0.012728+0.000230\ttest-mape:0.012811+0.000272 \n",
      "[693]\ttrain-mape:0.012710+0.000232\ttest-mape:0.012793+0.000274 \n",
      "[694]\ttrain-mape:0.012698+0.000230\ttest-mape:0.012781+0.000274 \n",
      "[695]\ttrain-mape:0.012681+0.000233\ttest-mape:0.012764+0.000276 \n",
      "[696]\ttrain-mape:0.012663+0.000225\ttest-mape:0.012746+0.000269 \n",
      "[697]\ttrain-mape:0.012649+0.000222\ttest-mape:0.012732+0.000265 \n",
      "[698]\ttrain-mape:0.012635+0.000228\ttest-mape:0.012718+0.000271 \n",
      "[699]\ttrain-mape:0.012623+0.000228\ttest-mape:0.012706+0.000270 \n",
      "[700]\ttrain-mape:0.012607+0.000224\ttest-mape:0.012689+0.000265 \n",
      "[701]\ttrain-mape:0.012594+0.000222\ttest-mape:0.012677+0.000263 \n",
      "[702]\ttrain-mape:0.012577+0.000222\ttest-mape:0.012660+0.000263 \n",
      "[703]\ttrain-mape:0.012562+0.000220\ttest-mape:0.012645+0.000261 \n",
      "[704]\ttrain-mape:0.012539+0.000217\ttest-mape:0.012621+0.000258 \n",
      "[705]\ttrain-mape:0.012526+0.000216\ttest-mape:0.012609+0.000256 \n",
      "[706]\ttrain-mape:0.012514+0.000211\ttest-mape:0.012596+0.000250 \n",
      "[707]\ttrain-mape:0.012499+0.000213\ttest-mape:0.012581+0.000253 \n",
      "[708]\ttrain-mape:0.012484+0.000209\ttest-mape:0.012566+0.000249 \n",
      "[709]\ttrain-mape:0.012467+0.000208\ttest-mape:0.012549+0.000249 \n",
      "[710]\ttrain-mape:0.012452+0.000203\ttest-mape:0.012534+0.000244 \n",
      "[711]\ttrain-mape:0.012442+0.000203\ttest-mape:0.012525+0.000245 \n",
      "[712]\ttrain-mape:0.012427+0.000196\ttest-mape:0.012510+0.000240 \n",
      "[713]\ttrain-mape:0.012410+0.000203\ttest-mape:0.012492+0.000244 \n",
      "[714]\ttrain-mape:0.012398+0.000196\ttest-mape:0.012480+0.000237 \n",
      "[715]\ttrain-mape:0.012386+0.000193\ttest-mape:0.012468+0.000235 \n",
      "[716]\ttrain-mape:0.012362+0.000188\ttest-mape:0.012444+0.000229 \n",
      "[717]\ttrain-mape:0.012348+0.000188\ttest-mape:0.012430+0.000228 \n",
      "[718]\ttrain-mape:0.012336+0.000191\ttest-mape:0.012418+0.000231 \n",
      "[719]\ttrain-mape:0.012329+0.000190\ttest-mape:0.012410+0.000229 \n",
      "[720]\ttrain-mape:0.012313+0.000184\ttest-mape:0.012395+0.000224 \n",
      "[721]\ttrain-mape:0.012303+0.000188\ttest-mape:0.012384+0.000228 \n",
      "[722]\ttrain-mape:0.012290+0.000182\ttest-mape:0.012372+0.000224 \n",
      "[723]\ttrain-mape:0.012279+0.000181\ttest-mape:0.012361+0.000223 \n",
      "[724]\ttrain-mape:0.012271+0.000180\ttest-mape:0.012352+0.000221 \n",
      "[725]\ttrain-mape:0.012260+0.000180\ttest-mape:0.012342+0.000222 \n",
      "[726]\ttrain-mape:0.012248+0.000181\ttest-mape:0.012330+0.000223 \n",
      "[727]\ttrain-mape:0.012237+0.000184\ttest-mape:0.012318+0.000226 \n",
      "[728]\ttrain-mape:0.012222+0.000180\ttest-mape:0.012304+0.000222 \n",
      "[729]\ttrain-mape:0.012213+0.000178\ttest-mape:0.012295+0.000221 \n",
      "[730]\ttrain-mape:0.012202+0.000173\ttest-mape:0.012284+0.000217 \n",
      "[731]\ttrain-mape:0.012193+0.000176\ttest-mape:0.012275+0.000218 \n",
      "[732]\ttrain-mape:0.012182+0.000176\ttest-mape:0.012263+0.000217 \n",
      "[733]\ttrain-mape:0.012165+0.000172\ttest-mape:0.012247+0.000215 \n",
      "[734]\ttrain-mape:0.012153+0.000172\ttest-mape:0.012235+0.000213 \n",
      "[735]\ttrain-mape:0.012137+0.000169\ttest-mape:0.012218+0.000210 \n",
      "[736]\ttrain-mape:0.012124+0.000164\ttest-mape:0.012205+0.000207 \n",
      "[737]\ttrain-mape:0.012110+0.000161\ttest-mape:0.012191+0.000205 \n",
      "[738]\ttrain-mape:0.012101+0.000162\ttest-mape:0.012182+0.000207 \n",
      "[739]\ttrain-mape:0.012089+0.000164\ttest-mape:0.012170+0.000207 \n",
      "[740]\ttrain-mape:0.012076+0.000160\ttest-mape:0.012156+0.000203 \n",
      "[741]\ttrain-mape:0.012066+0.000159\ttest-mape:0.012147+0.000202 \n",
      "[742]\ttrain-mape:0.012049+0.000152\ttest-mape:0.012130+0.000196 \n",
      "[743]\ttrain-mape:0.012037+0.000149\ttest-mape:0.012118+0.000192 \n",
      "[744]\ttrain-mape:0.012025+0.000152\ttest-mape:0.012105+0.000195 \n",
      "[745]\ttrain-mape:0.012017+0.000151\ttest-mape:0.012097+0.000192 \n",
      "[746]\ttrain-mape:0.012010+0.000154\ttest-mape:0.012090+0.000195 \n",
      "[747]\ttrain-mape:0.011997+0.000150\ttest-mape:0.012077+0.000191 \n",
      "[748]\ttrain-mape:0.011981+0.000146\ttest-mape:0.012061+0.000186 \n",
      "[749]\ttrain-mape:0.011975+0.000143\ttest-mape:0.012055+0.000184 \n",
      "[750]\ttrain-mape:0.011969+0.000145\ttest-mape:0.012048+0.000186 \n",
      "[751]\ttrain-mape:0.011957+0.000145\ttest-mape:0.012037+0.000184 \n",
      "[752]\ttrain-mape:0.011942+0.000150\ttest-mape:0.012022+0.000188 \n",
      "[753]\ttrain-mape:0.011935+0.000148\ttest-mape:0.012014+0.000186 \n",
      "[754]\ttrain-mape:0.011924+0.000145\ttest-mape:0.012003+0.000183 \n",
      "[755]\ttrain-mape:0.011916+0.000143\ttest-mape:0.011995+0.000182 \n",
      "[756]\ttrain-mape:0.011905+0.000142\ttest-mape:0.011985+0.000181 \n",
      "[757]\ttrain-mape:0.011893+0.000149\ttest-mape:0.011972+0.000187 \n",
      "[758]\ttrain-mape:0.011879+0.000141\ttest-mape:0.011959+0.000179 \n",
      "[759]\ttrain-mape:0.011874+0.000142\ttest-mape:0.011954+0.000179 \n",
      "[760]\ttrain-mape:0.011864+0.000138\ttest-mape:0.011944+0.000175 \n",
      "[761]\ttrain-mape:0.011853+0.000134\ttest-mape:0.011932+0.000172 \n",
      "[762]\ttrain-mape:0.011843+0.000131\ttest-mape:0.011923+0.000169 \n",
      "[763]\ttrain-mape:0.011833+0.000126\ttest-mape:0.011913+0.000163 \n",
      "[764]\ttrain-mape:0.011822+0.000127\ttest-mape:0.011901+0.000164 \n",
      "[765]\ttrain-mape:0.011810+0.000126\ttest-mape:0.011890+0.000164 \n",
      "[766]\ttrain-mape:0.011799+0.000128\ttest-mape:0.011878+0.000166 \n",
      "[767]\ttrain-mape:0.011791+0.000122\ttest-mape:0.011871+0.000161 \n",
      "[768]\ttrain-mape:0.011784+0.000123\ttest-mape:0.011863+0.000163 \n",
      "[769]\ttrain-mape:0.011775+0.000123\ttest-mape:0.011854+0.000164 \n",
      "[770]\ttrain-mape:0.011767+0.000119\ttest-mape:0.011846+0.000161 \n",
      "[771]\ttrain-mape:0.011758+0.000116\ttest-mape:0.011837+0.000157 \n",
      "[772]\ttrain-mape:0.011752+0.000119\ttest-mape:0.011831+0.000158 \n",
      "[773]\ttrain-mape:0.011739+0.000119\ttest-mape:0.011819+0.000158 \n",
      "[774]\ttrain-mape:0.011728+0.000119\ttest-mape:0.011808+0.000158 \n",
      "[775]\ttrain-mape:0.011720+0.000121\ttest-mape:0.011799+0.000159 \n",
      "[776]\ttrain-mape:0.011709+0.000121\ttest-mape:0.011788+0.000158 \n",
      "[777]\ttrain-mape:0.011698+0.000125\ttest-mape:0.011777+0.000160 \n",
      "[778]\ttrain-mape:0.011691+0.000128\ttest-mape:0.011770+0.000164 \n",
      "[779]\ttrain-mape:0.011683+0.000124\ttest-mape:0.011762+0.000161 \n",
      "[780]\ttrain-mape:0.011674+0.000122\ttest-mape:0.011753+0.000159 \n",
      "[781]\ttrain-mape:0.011669+0.000121\ttest-mape:0.011748+0.000158 \n",
      "[782]\ttrain-mape:0.011663+0.000123\ttest-mape:0.011742+0.000159 \n",
      "[783]\ttrain-mape:0.011656+0.000120\ttest-mape:0.011735+0.000157 \n",
      "[784]\ttrain-mape:0.011650+0.000118\ttest-mape:0.011728+0.000154 \n",
      "[785]\ttrain-mape:0.011638+0.000116\ttest-mape:0.011717+0.000150 \n",
      "[786]\ttrain-mape:0.011629+0.000118\ttest-mape:0.011707+0.000152 \n",
      "[787]\ttrain-mape:0.011620+0.000120\ttest-mape:0.011699+0.000153 \n",
      "[788]\ttrain-mape:0.011609+0.000118\ttest-mape:0.011687+0.000150 \n",
      "[789]\ttrain-mape:0.011603+0.000120\ttest-mape:0.011681+0.000151 \n",
      "[790]\ttrain-mape:0.011593+0.000115\ttest-mape:0.011672+0.000146 \n",
      "[791]\ttrain-mape:0.011586+0.000113\ttest-mape:0.011665+0.000145 \n",
      "[792]\ttrain-mape:0.011579+0.000111\ttest-mape:0.011658+0.000143 \n",
      "[793]\ttrain-mape:0.011570+0.000106\ttest-mape:0.011648+0.000139 \n",
      "[794]\ttrain-mape:0.011566+0.000104\ttest-mape:0.011645+0.000137 \n",
      "[795]\ttrain-mape:0.011561+0.000103\ttest-mape:0.011639+0.000137 \n",
      "[796]\ttrain-mape:0.011556+0.000102\ttest-mape:0.011634+0.000136 \n",
      "[797]\ttrain-mape:0.011548+0.000104\ttest-mape:0.011626+0.000139 \n",
      "[798]\ttrain-mape:0.011540+0.000102\ttest-mape:0.011618+0.000137 \n",
      "[799]\ttrain-mape:0.011533+0.000103\ttest-mape:0.011611+0.000138 \n",
      "[800]\ttrain-mape:0.011526+0.000103\ttest-mape:0.011604+0.000140 \n",
      "[801]\ttrain-mape:0.011519+0.000102\ttest-mape:0.011597+0.000137 \n",
      "[802]\ttrain-mape:0.011513+0.000101\ttest-mape:0.011591+0.000138 \n",
      "[803]\ttrain-mape:0.011504+0.000103\ttest-mape:0.011581+0.000139 \n",
      "[804]\ttrain-mape:0.011495+0.000106\ttest-mape:0.011573+0.000142 \n",
      "[805]\ttrain-mape:0.011487+0.000101\ttest-mape:0.011565+0.000139 \n",
      "[806]\ttrain-mape:0.011481+0.000101\ttest-mape:0.011558+0.000137 \n",
      "[807]\ttrain-mape:0.011471+0.000104\ttest-mape:0.011549+0.000140 \n",
      "[808]\ttrain-mape:0.011463+0.000104\ttest-mape:0.011540+0.000141 \n",
      "[809]\ttrain-mape:0.011456+0.000103\ttest-mape:0.011533+0.000141 \n",
      "[810]\ttrain-mape:0.011447+0.000107\ttest-mape:0.011525+0.000144 \n",
      "[811]\ttrain-mape:0.011439+0.000106\ttest-mape:0.011517+0.000144 \n",
      "[812]\ttrain-mape:0.011433+0.000107\ttest-mape:0.011511+0.000144 \n",
      "[813]\ttrain-mape:0.011425+0.000109\ttest-mape:0.011502+0.000146 \n",
      "[814]\ttrain-mape:0.011415+0.000106\ttest-mape:0.011492+0.000142 \n",
      "[815]\ttrain-mape:0.011410+0.000110\ttest-mape:0.011487+0.000145 \n",
      "[816]\ttrain-mape:0.011407+0.000111\ttest-mape:0.011485+0.000146 \n",
      "[817]\ttrain-mape:0.011402+0.000111\ttest-mape:0.011480+0.000147 \n",
      "[818]\ttrain-mape:0.011395+0.000112\ttest-mape:0.011472+0.000146 \n",
      "[819]\ttrain-mape:0.011388+0.000110\ttest-mape:0.011466+0.000144 \n",
      "[820]\ttrain-mape:0.011381+0.000109\ttest-mape:0.011458+0.000143 \n",
      "[821]\ttrain-mape:0.011376+0.000106\ttest-mape:0.011453+0.000140 \n",
      "[822]\ttrain-mape:0.011369+0.000107\ttest-mape:0.011447+0.000140 \n",
      "[823]\ttrain-mape:0.011365+0.000106\ttest-mape:0.011442+0.000139 \n",
      "[824]\ttrain-mape:0.011357+0.000108\ttest-mape:0.011434+0.000140 \n",
      "[825]\ttrain-mape:0.011350+0.000109\ttest-mape:0.011427+0.000142 \n",
      "[826]\ttrain-mape:0.011342+0.000106\ttest-mape:0.011419+0.000138 \n",
      "[827]\ttrain-mape:0.011334+0.000105\ttest-mape:0.011411+0.000136 \n",
      "[828]\ttrain-mape:0.011329+0.000106\ttest-mape:0.011406+0.000136 \n",
      "[829]\ttrain-mape:0.011323+0.000107\ttest-mape:0.011400+0.000137 \n",
      "[830]\ttrain-mape:0.011320+0.000106\ttest-mape:0.011397+0.000136 \n",
      "[831]\ttrain-mape:0.011310+0.000106\ttest-mape:0.011387+0.000137 \n",
      "[832]\ttrain-mape:0.011304+0.000104\ttest-mape:0.011381+0.000135 \n",
      "[833]\ttrain-mape:0.011296+0.000105\ttest-mape:0.011373+0.000136 \n",
      "[834]\ttrain-mape:0.011286+0.000106\ttest-mape:0.011363+0.000135 \n",
      "[835]\ttrain-mape:0.011282+0.000104\ttest-mape:0.011359+0.000134 \n",
      "[836]\ttrain-mape:0.011274+0.000106\ttest-mape:0.011351+0.000135 \n",
      "[837]\ttrain-mape:0.011269+0.000103\ttest-mape:0.011346+0.000133 \n",
      "[838]\ttrain-mape:0.011262+0.000104\ttest-mape:0.011339+0.000134 \n",
      "[839]\ttrain-mape:0.011258+0.000103\ttest-mape:0.011335+0.000132 \n",
      "[840]\ttrain-mape:0.011252+0.000105\ttest-mape:0.011329+0.000133 \n",
      "[841]\ttrain-mape:0.011247+0.000102\ttest-mape:0.011323+0.000131 \n",
      "[842]\ttrain-mape:0.011239+0.000107\ttest-mape:0.011316+0.000135 \n",
      "[843]\ttrain-mape:0.011235+0.000105\ttest-mape:0.011312+0.000133 \n",
      "[844]\ttrain-mape:0.011230+0.000103\ttest-mape:0.011306+0.000131 \n",
      "[845]\ttrain-mape:0.011225+0.000102\ttest-mape:0.011302+0.000131 \n",
      "[846]\ttrain-mape:0.011219+0.000098\ttest-mape:0.011296+0.000127 \n",
      "[847]\ttrain-mape:0.011214+0.000097\ttest-mape:0.011290+0.000126 \n",
      "[848]\ttrain-mape:0.011209+0.000098\ttest-mape:0.011286+0.000127 \n",
      "[849]\ttrain-mape:0.011205+0.000100\ttest-mape:0.011281+0.000128 \n",
      "[850]\ttrain-mape:0.011200+0.000099\ttest-mape:0.011276+0.000128 \n",
      "[851]\ttrain-mape:0.011194+0.000098\ttest-mape:0.011270+0.000128 \n",
      "[852]\ttrain-mape:0.011186+0.000096\ttest-mape:0.011262+0.000124 \n",
      "[853]\ttrain-mape:0.011183+0.000096\ttest-mape:0.011259+0.000125 \n",
      "[854]\ttrain-mape:0.011177+0.000095\ttest-mape:0.011253+0.000124 \n",
      "[855]\ttrain-mape:0.011170+0.000096\ttest-mape:0.011246+0.000125 \n",
      "[856]\ttrain-mape:0.011165+0.000097\ttest-mape:0.011241+0.000126 \n",
      "[857]\ttrain-mape:0.011157+0.000096\ttest-mape:0.011233+0.000123 \n",
      "[858]\ttrain-mape:0.011149+0.000095\ttest-mape:0.011225+0.000121 \n",
      "[859]\ttrain-mape:0.011146+0.000095\ttest-mape:0.011222+0.000121 \n",
      "[860]\ttrain-mape:0.011138+0.000098\ttest-mape:0.011214+0.000124 \n",
      "[861]\ttrain-mape:0.011131+0.000099\ttest-mape:0.011207+0.000125 \n",
      "[862]\ttrain-mape:0.011124+0.000099\ttest-mape:0.011200+0.000124 \n",
      "[863]\ttrain-mape:0.011117+0.000098\ttest-mape:0.011193+0.000123 \n",
      "[864]\ttrain-mape:0.011113+0.000098\ttest-mape:0.011189+0.000123 \n",
      "[865]\ttrain-mape:0.011110+0.000098\ttest-mape:0.011186+0.000123 \n",
      "[866]\ttrain-mape:0.011107+0.000099\ttest-mape:0.011183+0.000123 \n",
      "[867]\ttrain-mape:0.011102+0.000099\ttest-mape:0.011178+0.000123 \n",
      "[868]\ttrain-mape:0.011097+0.000099\ttest-mape:0.011173+0.000122 \n",
      "[869]\ttrain-mape:0.011090+0.000098\ttest-mape:0.011167+0.000122 \n",
      "[870]\ttrain-mape:0.011085+0.000097\ttest-mape:0.011162+0.000120 \n",
      "[871]\ttrain-mape:0.011077+0.000092\ttest-mape:0.011153+0.000116 \n",
      "[872]\ttrain-mape:0.011073+0.000090\ttest-mape:0.011148+0.000114 \n",
      "[873]\ttrain-mape:0.011067+0.000089\ttest-mape:0.011143+0.000113 \n",
      "[874]\ttrain-mape:0.011063+0.000086\ttest-mape:0.011139+0.000110 \n",
      "[875]\ttrain-mape:0.011059+0.000088\ttest-mape:0.011134+0.000111 \n",
      "[876]\ttrain-mape:0.011054+0.000085\ttest-mape:0.011129+0.000107 \n",
      "[877]\ttrain-mape:0.011047+0.000086\ttest-mape:0.011122+0.000108 \n",
      "[878]\ttrain-mape:0.011040+0.000085\ttest-mape:0.011115+0.000107 \n",
      "[879]\ttrain-mape:0.011034+0.000085\ttest-mape:0.011110+0.000106 \n",
      "[880]\ttrain-mape:0.011027+0.000083\ttest-mape:0.011102+0.000103 \n",
      "[881]\ttrain-mape:0.011022+0.000080\ttest-mape:0.011097+0.000101 \n",
      "[882]\ttrain-mape:0.011016+0.000081\ttest-mape:0.011092+0.000101 \n",
      "[883]\ttrain-mape:0.011011+0.000085\ttest-mape:0.011086+0.000104 \n",
      "[884]\ttrain-mape:0.011005+0.000085\ttest-mape:0.011080+0.000104 \n",
      "[885]\ttrain-mape:0.010998+0.000086\ttest-mape:0.011074+0.000105 \n",
      "[886]\ttrain-mape:0.010992+0.000088\ttest-mape:0.011068+0.000108 \n",
      "[887]\ttrain-mape:0.010990+0.000087\ttest-mape:0.011065+0.000107 \n",
      "[888]\ttrain-mape:0.010985+0.000090\ttest-mape:0.011061+0.000110 \n",
      "[889]\ttrain-mape:0.010981+0.000091\ttest-mape:0.011056+0.000111 \n",
      "[890]\ttrain-mape:0.010976+0.000088\ttest-mape:0.011052+0.000108 \n",
      "[891]\ttrain-mape:0.010972+0.000085\ttest-mape:0.011048+0.000105 \n",
      "[892]\ttrain-mape:0.010965+0.000085\ttest-mape:0.011040+0.000104 \n",
      "[893]\ttrain-mape:0.010963+0.000085\ttest-mape:0.011039+0.000104 \n",
      "[894]\ttrain-mape:0.010960+0.000085\ttest-mape:0.011035+0.000103 \n",
      "[895]\ttrain-mape:0.010957+0.000087\ttest-mape:0.011032+0.000104 \n",
      "[896]\ttrain-mape:0.010953+0.000088\ttest-mape:0.011029+0.000106 \n",
      "[897]\ttrain-mape:0.010948+0.000089\ttest-mape:0.011023+0.000108 \n",
      "[898]\ttrain-mape:0.010941+0.000088\ttest-mape:0.011017+0.000107 \n",
      "[899]\ttrain-mape:0.010938+0.000089\ttest-mape:0.011013+0.000107 \n",
      "[900]\ttrain-mape:0.010927+0.000081\ttest-mape:0.011003+0.000101 \n",
      "[901]\ttrain-mape:0.010921+0.000079\ttest-mape:0.010997+0.000098 \n",
      "[902]\ttrain-mape:0.010914+0.000076\ttest-mape:0.010989+0.000095 \n",
      "[903]\ttrain-mape:0.010905+0.000075\ttest-mape:0.010981+0.000092 \n",
      "[904]\ttrain-mape:0.010902+0.000076\ttest-mape:0.010978+0.000094 \n",
      "[905]\ttrain-mape:0.010897+0.000075\ttest-mape:0.010973+0.000093 \n",
      "[906]\ttrain-mape:0.010891+0.000071\ttest-mape:0.010967+0.000089 \n",
      "[907]\ttrain-mape:0.010888+0.000070\ttest-mape:0.010963+0.000088 \n",
      "[908]\ttrain-mape:0.010882+0.000071\ttest-mape:0.010957+0.000090 \n",
      "[909]\ttrain-mape:0.010879+0.000072\ttest-mape:0.010955+0.000091 \n",
      "[910]\ttrain-mape:0.010872+0.000073\ttest-mape:0.010948+0.000092 \n",
      "[911]\ttrain-mape:0.010870+0.000073\ttest-mape:0.010946+0.000092 \n",
      "[912]\ttrain-mape:0.010867+0.000073\ttest-mape:0.010943+0.000091 \n",
      "[913]\ttrain-mape:0.010864+0.000074\ttest-mape:0.010940+0.000091 \n",
      "[914]\ttrain-mape:0.010861+0.000074\ttest-mape:0.010937+0.000091 \n",
      "[915]\ttrain-mape:0.010856+0.000074\ttest-mape:0.010931+0.000092 \n",
      "[916]\ttrain-mape:0.010850+0.000075\ttest-mape:0.010926+0.000091 \n",
      "[917]\ttrain-mape:0.010847+0.000076\ttest-mape:0.010922+0.000092 \n",
      "[918]\ttrain-mape:0.010843+0.000078\ttest-mape:0.010919+0.000093 \n",
      "[919]\ttrain-mape:0.010838+0.000080\ttest-mape:0.010913+0.000095 \n",
      "[920]\ttrain-mape:0.010832+0.000079\ttest-mape:0.010907+0.000094 \n",
      "[921]\ttrain-mape:0.010828+0.000077\ttest-mape:0.010903+0.000092 \n",
      "[922]\ttrain-mape:0.010822+0.000079\ttest-mape:0.010897+0.000093 \n",
      "[923]\ttrain-mape:0.010819+0.000079\ttest-mape:0.010894+0.000094 \n",
      "[924]\ttrain-mape:0.010813+0.000081\ttest-mape:0.010888+0.000098 \n",
      "[925]\ttrain-mape:0.010810+0.000082\ttest-mape:0.010885+0.000099 \n",
      "[926]\ttrain-mape:0.010807+0.000081\ttest-mape:0.010882+0.000097 \n",
      "[927]\ttrain-mape:0.010803+0.000082\ttest-mape:0.010878+0.000100 \n",
      "[928]\ttrain-mape:0.010798+0.000080\ttest-mape:0.010873+0.000098 \n",
      "[929]\ttrain-mape:0.010796+0.000080\ttest-mape:0.010871+0.000098 \n",
      "[930]\ttrain-mape:0.010793+0.000079\ttest-mape:0.010869+0.000097 \n",
      "[931]\ttrain-mape:0.010791+0.000079\ttest-mape:0.010866+0.000096 \n",
      "[932]\ttrain-mape:0.010787+0.000078\ttest-mape:0.010862+0.000096 \n",
      "[933]\ttrain-mape:0.010784+0.000077\ttest-mape:0.010859+0.000095 \n",
      "[934]\ttrain-mape:0.010780+0.000078\ttest-mape:0.010855+0.000096 \n",
      "[935]\ttrain-mape:0.010776+0.000079\ttest-mape:0.010851+0.000095 \n",
      "[936]\ttrain-mape:0.010774+0.000079\ttest-mape:0.010849+0.000095 \n",
      "[937]\ttrain-mape:0.010770+0.000076\ttest-mape:0.010845+0.000093 \n",
      "[938]\ttrain-mape:0.010769+0.000077\ttest-mape:0.010844+0.000094 \n",
      "[939]\ttrain-mape:0.010764+0.000076\ttest-mape:0.010839+0.000092 \n",
      "[940]\ttrain-mape:0.010757+0.000074\ttest-mape:0.010832+0.000091 \n",
      "[941]\ttrain-mape:0.010753+0.000072\ttest-mape:0.010828+0.000089 \n",
      "[942]\ttrain-mape:0.010748+0.000072\ttest-mape:0.010823+0.000090 \n",
      "[943]\ttrain-mape:0.010743+0.000068\ttest-mape:0.010818+0.000086 \n",
      "[944]\ttrain-mape:0.010738+0.000067\ttest-mape:0.010812+0.000085 \n",
      "[945]\ttrain-mape:0.010735+0.000067\ttest-mape:0.010809+0.000087 \n",
      "[946]\ttrain-mape:0.010732+0.000066\ttest-mape:0.010806+0.000085 \n",
      "[947]\ttrain-mape:0.010729+0.000067\ttest-mape:0.010803+0.000086 \n",
      "[948]\ttrain-mape:0.010726+0.000066\ttest-mape:0.010800+0.000086 \n",
      "[949]\ttrain-mape:0.010723+0.000064\ttest-mape:0.010797+0.000084 \n",
      "[950]\ttrain-mape:0.010721+0.000065\ttest-mape:0.010795+0.000084 \n",
      "[951]\ttrain-mape:0.010718+0.000064\ttest-mape:0.010792+0.000083 \n",
      "[952]\ttrain-mape:0.010716+0.000061\ttest-mape:0.010790+0.000082 \n",
      "[953]\ttrain-mape:0.010711+0.000059\ttest-mape:0.010785+0.000079 \n",
      "[954]\ttrain-mape:0.010708+0.000059\ttest-mape:0.010782+0.000079 \n",
      "[955]\ttrain-mape:0.010706+0.000060\ttest-mape:0.010781+0.000081 \n",
      "[956]\ttrain-mape:0.010702+0.000062\ttest-mape:0.010776+0.000083 \n",
      "[957]\ttrain-mape:0.010698+0.000060\ttest-mape:0.010772+0.000081 \n",
      "[958]\ttrain-mape:0.010691+0.000059\ttest-mape:0.010765+0.000081 \n",
      "[959]\ttrain-mape:0.010690+0.000060\ttest-mape:0.010764+0.000081 \n",
      "[960]\ttrain-mape:0.010684+0.000059\ttest-mape:0.010758+0.000081 \n",
      "[961]\ttrain-mape:0.010682+0.000060\ttest-mape:0.010756+0.000081 \n",
      "[962]\ttrain-mape:0.010679+0.000058\ttest-mape:0.010753+0.000079 \n",
      "[963]\ttrain-mape:0.010674+0.000060\ttest-mape:0.010748+0.000082 \n",
      "[964]\ttrain-mape:0.010668+0.000059\ttest-mape:0.010742+0.000081 \n",
      "[965]\ttrain-mape:0.010665+0.000058\ttest-mape:0.010739+0.000081 \n",
      "[966]\ttrain-mape:0.010661+0.000060\ttest-mape:0.010734+0.000082 \n",
      "[967]\ttrain-mape:0.010657+0.000059\ttest-mape:0.010731+0.000080 \n",
      "[968]\ttrain-mape:0.010651+0.000059\ttest-mape:0.010725+0.000081 \n",
      "[969]\ttrain-mape:0.010648+0.000059\ttest-mape:0.010722+0.000081 \n",
      "[970]\ttrain-mape:0.010643+0.000059\ttest-mape:0.010716+0.000080 \n",
      "[971]\ttrain-mape:0.010639+0.000059\ttest-mape:0.010712+0.000081 \n",
      "[972]\ttrain-mape:0.010637+0.000061\ttest-mape:0.010711+0.000083 \n",
      "[973]\ttrain-mape:0.010634+0.000062\ttest-mape:0.010708+0.000085 \n",
      "[974]\ttrain-mape:0.010629+0.000063\ttest-mape:0.010703+0.000085 \n",
      "[975]\ttrain-mape:0.010627+0.000062\ttest-mape:0.010700+0.000085 \n",
      "[976]\ttrain-mape:0.010624+0.000064\ttest-mape:0.010697+0.000087 \n",
      "[977]\ttrain-mape:0.010619+0.000062\ttest-mape:0.010692+0.000083 \n",
      "[978]\ttrain-mape:0.010613+0.000059\ttest-mape:0.010686+0.000081 \n",
      "[979]\ttrain-mape:0.010611+0.000058\ttest-mape:0.010685+0.000080 \n",
      "[980]\ttrain-mape:0.010607+0.000057\ttest-mape:0.010681+0.000079 \n",
      "[981]\ttrain-mape:0.010606+0.000058\ttest-mape:0.010679+0.000080 \n",
      "[982]\ttrain-mape:0.010604+0.000058\ttest-mape:0.010677+0.000079 \n",
      "[983]\ttrain-mape:0.010601+0.000058\ttest-mape:0.010675+0.000080 \n",
      "[984]\ttrain-mape:0.010596+0.000059\ttest-mape:0.010670+0.000081 \n",
      "[985]\ttrain-mape:0.010593+0.000057\ttest-mape:0.010667+0.000079 \n",
      "[986]\ttrain-mape:0.010591+0.000057\ttest-mape:0.010665+0.000078 \n",
      "[987]\ttrain-mape:0.010586+0.000055\ttest-mape:0.010660+0.000076 \n",
      "[988]\ttrain-mape:0.010583+0.000055\ttest-mape:0.010656+0.000077 \n",
      "[989]\ttrain-mape:0.010580+0.000057\ttest-mape:0.010653+0.000078 \n",
      "[990]\ttrain-mape:0.010577+0.000055\ttest-mape:0.010650+0.000078 \n",
      "[991]\ttrain-mape:0.010574+0.000054\ttest-mape:0.010647+0.000077 \n",
      "[992]\ttrain-mape:0.010569+0.000055\ttest-mape:0.010642+0.000078 \n",
      "[993]\ttrain-mape:0.010567+0.000054\ttest-mape:0.010641+0.000078 \n",
      "[994]\ttrain-mape:0.010562+0.000053\ttest-mape:0.010636+0.000076 \n",
      "[995]\ttrain-mape:0.010559+0.000053\ttest-mape:0.010632+0.000076 \n",
      "[996]\ttrain-mape:0.010556+0.000051\ttest-mape:0.010629+0.000074 \n",
      "[997]\ttrain-mape:0.010553+0.000051\ttest-mape:0.010626+0.000074 \n",
      "[998]\ttrain-mape:0.010548+0.000050\ttest-mape:0.010621+0.000074 \n",
      "[999]\ttrain-mape:0.010544+0.000049\ttest-mape:0.010617+0.000072 \n",
      "[1000]\ttrain-mape:0.010540+0.000047\ttest-mape:0.010613+0.000069 \n"
     ]
    }
   ],
   "source": [
    "set.seed(112) # Setting seed \n",
    "xgbcv = xgb.cv(params = param_list, \n",
    "            data = Dtrain, \n",
    "            nrounds = 1000, \n",
    "            nfold = 5, \n",
    "            print_every_n = 1, \n",
    "            early_stopping_rounds = 30,\n",
    "            metrics = list('mape'),\n",
    "            verbose = TRUE,\n",
    "            maximize = FALSE) "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "06b343c0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:42:10.240601Z",
     "iopub.status.busy": "2025-01-03T15:42:10.239008Z",
     "iopub.status.idle": "2025-01-03T15:44:21.470068Z",
     "shell.execute_reply": "2025-01-03T15:44:21.467166Z"
    },
    "papermill": {
     "duration": 131.31961,
     "end_time": "2025-01-03T15:44:21.515690",
     "exception": false,
     "start_time": "2025-01-03T15:42:10.196080",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[15:42:10] WARNING: src/objective/regression_obj.cu:213: reg:linear is now deprecated in favor of reg:squarederror.\n"
     ]
    }
   ],
   "source": [
    "best_nrounds <- xgbcv$best_iteration\n",
    "final_model <- xgb.train(\n",
    "  params = param_list,\n",
    "  data = Dtrain,\n",
    "  nrounds = best_nrounds\n",
    ")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "25c7650c",
   "metadata": {
    "papermill": {
     "duration": 0.040336,
     "end_time": "2025-01-03T15:44:21.596139",
     "exception": false,
     "start_time": "2025-01-03T15:44:21.555803",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<h3>Preparing test dataset</h3>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "34b909b0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:44:21.680786Z",
     "iopub.status.busy": "2025-01-03T15:44:21.679120Z",
     "iopub.status.idle": "2025-01-03T15:44:21.734577Z",
     "shell.execute_reply": "2025-01-03T15:44:21.731973Z"
    },
    "papermill": {
     "duration": 0.101206,
     "end_time": "2025-01-03T15:44:21.737566",
     "exception": false,
     "start_time": "2025-01-03T15:44:21.636360",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>date</th><th scope=col>country</th><th scope=col>store</th><th scope=col>product</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>weekday</th></tr>\n",
       "\t<tr><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Holographic Goose </td><td>2017</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle            </td><td>2017</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kaggle Tiers      </td><td>2017</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler          </td><td>2017</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2017-01-01</td><td>Canada</td><td>Discount Stickers</td><td>Kerneler Dark Mode</td><td>2017</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>2017-01-01</td><td>Canada</td><td>Stickers for Less</td><td>Holographic Goose </td><td>2017</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 8\n",
       "\\begin{tabular}{llllllll}\n",
       " date & country & store & product & year & month & day & weekday\\\\\n",
       " <date> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2017-01-01 & Canada & Discount Stickers & Holographic Goose  & 2017 & 1 & 1 & 1\\\\\n",
       "\t 2017-01-01 & Canada & Discount Stickers & Kaggle             & 2017 & 1 & 1 & 1\\\\\n",
       "\t 2017-01-01 & Canada & Discount Stickers & Kaggle Tiers       & 2017 & 1 & 1 & 1\\\\\n",
       "\t 2017-01-01 & Canada & Discount Stickers & Kerneler           & 2017 & 1 & 1 & 1\\\\\n",
       "\t 2017-01-01 & Canada & Discount Stickers & Kerneler Dark Mode & 2017 & 1 & 1 & 1\\\\\n",
       "\t 2017-01-01 & Canada & Stickers for Less & Holographic Goose  & 2017 & 1 & 1 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 8\n",
       "\n",
       "| date &lt;date&gt; | country &lt;chr&gt; | store &lt;chr&gt; | product &lt;chr&gt; | year &lt;dbl&gt; | month &lt;dbl&gt; | day &lt;int&gt; | weekday &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 2017-01-01 | Canada | Discount Stickers | Holographic Goose  | 2017 | 1 | 1 | 1 |\n",
       "| 2017-01-01 | Canada | Discount Stickers | Kaggle             | 2017 | 1 | 1 | 1 |\n",
       "| 2017-01-01 | Canada | Discount Stickers | Kaggle Tiers       | 2017 | 1 | 1 | 1 |\n",
       "| 2017-01-01 | Canada | Discount Stickers | Kerneler           | 2017 | 1 | 1 | 1 |\n",
       "| 2017-01-01 | Canada | Discount Stickers | Kerneler Dark Mode | 2017 | 1 | 1 | 1 |\n",
       "| 2017-01-01 | Canada | Stickers for Less | Holographic Goose  | 2017 | 1 | 1 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  date       country store             product            year month day\n",
       "1 2017-01-01 Canada  Discount Stickers Holographic Goose  2017 1     1  \n",
       "2 2017-01-01 Canada  Discount Stickers Kaggle             2017 1     1  \n",
       "3 2017-01-01 Canada  Discount Stickers Kaggle Tiers       2017 1     1  \n",
       "4 2017-01-01 Canada  Discount Stickers Kerneler           2017 1     1  \n",
       "5 2017-01-01 Canada  Discount Stickers Kerneler Dark Mode 2017 1     1  \n",
       "6 2017-01-01 Canada  Stickers for Less Holographic Goose  2017 1     1  \n",
       "  weekday\n",
       "1 1      \n",
       "2 1      \n",
       "3 1      \n",
       "4 1      \n",
       "5 1      \n",
       "6 1      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "a08895f1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:44:21.822461Z",
     "iopub.status.busy": "2025-01-03T15:44:21.820856Z",
     "iopub.status.idle": "2025-01-03T15:44:22.452421Z",
     "shell.execute_reply": "2025-01-03T15:44:22.449643Z"
    },
    "papermill": {
     "duration": 0.677836,
     "end_time": "2025-01-03T15:44:22.455787",
     "exception": false,
     "start_time": "2025-01-03T15:44:21.777951",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>countryCanada</th><th scope=col>countryFinland</th><th scope=col>countryItaly</th><th scope=col>countryKenya</th><th scope=col>countryNorway</th><th scope=col>countrySingapore</th><th scope=col>storeDiscount.Stickers</th><th scope=col>storePremium.Sticker.Mart</th><th scope=col>storeStickers.for.Less</th><th scope=col>productHolographic.Goose</th><th scope=col>productKaggle</th><th scope=col>productKaggle.Tiers</th><th scope=col>productKerneler</th><th scope=col>productKerneler.Dark.Mode</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 14\n",
       "\\begin{tabular}{r|llllllllllllll}\n",
       "  & countryCanada & countryFinland & countryItaly & countryKenya & countryNorway & countrySingapore & storeDiscount.Stickers & storePremium.Sticker.Mart & storeStickers.for.Less & productHolographic.Goose & productKaggle & productKaggle.Tiers & productKerneler & productKerneler.Dark.Mode\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 0 & 0 & 0 & 0\\\\\n",
       "\t2 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 1 & 0 & 0 & 0\\\\\n",
       "\t3 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 1 & 0 & 0\\\\\n",
       "\t4 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0\\\\\n",
       "\t5 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 1\\\\\n",
       "\t6 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 0\\\\\n",
       "\t7 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 1 & 0 & 0 & 0\\\\\n",
       "\t8 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 0 & 0\\\\\n",
       "\t9 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 1 & 0\\\\\n",
       "\t10 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 14\n",
       "\n",
       "| <!--/--> | countryCanada &lt;dbl&gt; | countryFinland &lt;dbl&gt; | countryItaly &lt;dbl&gt; | countryKenya &lt;dbl&gt; | countryNorway &lt;dbl&gt; | countrySingapore &lt;dbl&gt; | storeDiscount.Stickers &lt;dbl&gt; | storePremium.Sticker.Mart &lt;dbl&gt; | storeStickers.for.Less &lt;dbl&gt; | productHolographic.Goose &lt;dbl&gt; | productKaggle &lt;dbl&gt; | productKaggle.Tiers &lt;dbl&gt; | productKerneler &lt;dbl&gt; | productKerneler.Dark.Mode &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |\n",
       "| 2 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |\n",
       "| 3 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |\n",
       "| 4 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |\n",
       "| 5 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |\n",
       "| 6 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |\n",
       "| 7 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 |\n",
       "| 8 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |\n",
       "| 9 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 |\n",
       "| 10 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "   countryCanada countryFinland countryItaly countryKenya countryNorway\n",
       "1  1             0              0            0            0            \n",
       "2  1             0              0            0            0            \n",
       "3  1             0              0            0            0            \n",
       "4  1             0              0            0            0            \n",
       "5  1             0              0            0            0            \n",
       "6  1             0              0            0            0            \n",
       "7  1             0              0            0            0            \n",
       "8  1             0              0            0            0            \n",
       "9  1             0              0            0            0            \n",
       "10 1             0              0            0            0            \n",
       "   countrySingapore storeDiscount.Stickers storePremium.Sticker.Mart\n",
       "1  0                1                      0                        \n",
       "2  0                1                      0                        \n",
       "3  0                1                      0                        \n",
       "4  0                1                      0                        \n",
       "5  0                1                      0                        \n",
       "6  0                0                      0                        \n",
       "7  0                0                      0                        \n",
       "8  0                0                      0                        \n",
       "9  0                0                      0                        \n",
       "10 0                0                      0                        \n",
       "   storeStickers.for.Less productHolographic.Goose productKaggle\n",
       "1  0                      1                        0            \n",
       "2  0                      0                        1            \n",
       "3  0                      0                        0            \n",
       "4  0                      0                        0            \n",
       "5  0                      0                        0            \n",
       "6  1                      1                        0            \n",
       "7  1                      0                        1            \n",
       "8  1                      0                        0            \n",
       "9  1                      0                        0            \n",
       "10 1                      0                        0            \n",
       "   productKaggle.Tiers productKerneler productKerneler.Dark.Mode\n",
       "1  0                   0               0                        \n",
       "2  0                   0               0                        \n",
       "3  1                   0               0                        \n",
       "4  0                   1               0                        \n",
       "5  0                   0               1                        \n",
       "6  0                   0               0                        \n",
       "7  0                   0               0                        \n",
       "8  1                   0               0                        \n",
       "9  0                   1               0                        \n",
       "10 0                   0               1                        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "temp_test <- test\n",
    "ohe_test_df <- data.frame(predict(ohe, temp_test))\n",
    "head(ohe_test_df, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "b8a87a6e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:44:22.541681Z",
     "iopub.status.busy": "2025-01-03T15:44:22.540066Z",
     "iopub.status.idle": "2025-01-03T15:44:22.573590Z",
     "shell.execute_reply": "2025-01-03T15:44:22.571110Z"
    },
    "papermill": {
     "duration": 0.079354,
     "end_time": "2025-01-03T15:44:22.576574",
     "exception": false,
     "start_time": "2025-01-03T15:44:22.497220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 6 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>weekday</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1.999409</td><td>-1.601263</td><td>-1.673844</td><td>-1.500608</td></tr>\n",
       "\t<tr><td>1.999409</td><td>-1.601263</td><td>-1.673844</td><td>-1.500608</td></tr>\n",
       "\t<tr><td>1.999409</td><td>-1.601263</td><td>-1.673844</td><td>-1.500608</td></tr>\n",
       "\t<tr><td>1.999409</td><td>-1.601263</td><td>-1.673844</td><td>-1.500608</td></tr>\n",
       "\t<tr><td>1.999409</td><td>-1.601263</td><td>-1.673844</td><td>-1.500608</td></tr>\n",
       "\t<tr><td>1.999409</td><td>-1.601263</td><td>-1.673844</td><td>-1.500608</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 6 × 4 of type dbl\n",
       "\\begin{tabular}{llll}\n",
       " year & month & day & weekday\\\\\n",
       "\\hline\n",
       "\t 1.999409 & -1.601263 & -1.673844 & -1.500608\\\\\n",
       "\t 1.999409 & -1.601263 & -1.673844 & -1.500608\\\\\n",
       "\t 1.999409 & -1.601263 & -1.673844 & -1.500608\\\\\n",
       "\t 1.999409 & -1.601263 & -1.673844 & -1.500608\\\\\n",
       "\t 1.999409 & -1.601263 & -1.673844 & -1.500608\\\\\n",
       "\t 1.999409 & -1.601263 & -1.673844 & -1.500608\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 6 × 4 of type dbl\n",
       "\n",
       "| year | month | day | weekday |\n",
       "|---|---|---|---|\n",
       "| 1.999409 | -1.601263 | -1.673844 | -1.500608 |\n",
       "| 1.999409 | -1.601263 | -1.673844 | -1.500608 |\n",
       "| 1.999409 | -1.601263 | -1.673844 | -1.500608 |\n",
       "| 1.999409 | -1.601263 | -1.673844 | -1.500608 |\n",
       "| 1.999409 | -1.601263 | -1.673844 | -1.500608 |\n",
       "| 1.999409 | -1.601263 | -1.673844 | -1.500608 |\n",
       "\n"
      ],
      "text/plain": [
       "     year     month     day       weekday  \n",
       "[1,] 1.999409 -1.601263 -1.673844 -1.500608\n",
       "[2,] 1.999409 -1.601263 -1.673844 -1.500608\n",
       "[3,] 1.999409 -1.601263 -1.673844 -1.500608\n",
       "[4,] 1.999409 -1.601263 -1.673844 -1.500608\n",
       "[5,] 1.999409 -1.601263 -1.673844 -1.500608\n",
       "[6,] 1.999409 -1.601263 -1.673844 -1.500608"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "scaled_test_df <- scale(temp_test[, NUM_FEATS], center=attr(scaled_df, \"scaled:center\"), scale=attr(scaled_df, \"scaled:scale\"))\n",
    "head(scaled_test_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "b986cff4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:44:22.663834Z",
     "iopub.status.busy": "2025-01-03T15:44:22.662305Z",
     "iopub.status.idle": "2025-01-03T15:44:22.773129Z",
     "shell.execute_reply": "2025-01-03T15:44:22.770956Z"
    },
    "papermill": {
     "duration": 0.159839,
     "end_time": "2025-01-03T15:44:22.777168",
     "exception": false,
     "start_time": "2025-01-03T15:44:22.617329",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "X_test <- cbind(ohe_test_df, scaled_test_df)\n",
    "Dtest <- xgb.DMatrix(data = as.matrix(X_test))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "dc9b6f0d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:44:22.866473Z",
     "iopub.status.busy": "2025-01-03T15:44:22.864742Z",
     "iopub.status.idle": "2025-01-03T15:44:24.073133Z",
     "shell.execute_reply": "2025-01-03T15:44:24.070866Z"
    },
    "papermill": {
     "duration": 1.254536,
     "end_time": "2025-01-03T15:44:24.075889",
     "exception": false,
     "start_time": "2025-01-03T15:44:22.821353",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>168.562101812914</li><li>781.282701842539</li><li>662.809293572982</li><li>354.227146745129</li><li>456.688687724069</li><li>268.704842746868</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 168.562101812914\n",
       "\\item 781.282701842539\n",
       "\\item 662.809293572982\n",
       "\\item 354.227146745129\n",
       "\\item 456.688687724069\n",
       "\\item 268.704842746868\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 168.562101812914\n",
       "2. 781.282701842539\n",
       "3. 662.809293572982\n",
       "4. 354.227146745129\n",
       "5. 456.688687724069\n",
       "6. 268.704842746868\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 168.5621 781.2827 662.8093 354.2271 456.6887 268.7048"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pred <- predict(final_model, Dtest)\n",
    "test <- exp(pred) - 1.0\n",
    "head(test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "37c0c19e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:44:24.166319Z",
     "iopub.status.busy": "2025-01-03T15:44:24.164664Z",
     "iopub.status.idle": "2025-01-03T15:44:24.192477Z",
     "shell.execute_reply": "2025-01-03T15:44:24.190026Z"
    },
    "papermill": {
     "duration": 0.078344,
     "end_time": "2025-01-03T15:44:24.196088",
     "exception": false,
     "start_time": "2025-01-03T15:44:24.117744",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>num_sold</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>230130</td><td>168.5621</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>230131</td><td>781.2827</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>230132</td><td>662.8093</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>230133</td><td>354.2271</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>230134</td><td>456.6887</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>230135</td><td>268.7048</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & id & num\\_sold\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 230130 & 168.5621\\\\\n",
       "\t2 & 230131 & 781.2827\\\\\n",
       "\t3 & 230132 & 662.8093\\\\\n",
       "\t4 & 230133 & 354.2271\\\\\n",
       "\t5 & 230134 & 456.6887\\\\\n",
       "\t6 & 230135 & 268.7048\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | num_sold &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 230130 | 168.5621 |\n",
       "| 2 | 230131 | 781.2827 |\n",
       "| 3 | 230132 | 662.8093 |\n",
       "| 4 | 230133 | 354.2271 |\n",
       "| 5 | 230134 | 456.6887 |\n",
       "| 6 | 230135 | 268.7048 |\n",
       "\n"
      ],
      "text/plain": [
       "  id     num_sold\n",
       "1 230130 168.5621\n",
       "2 230131 781.2827\n",
       "3 230132 662.8093\n",
       "4 230133 354.2271\n",
       "5 230134 456.6887\n",
       "6 230135 268.7048"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "submission_df <- data.frame( id = test_ids, num_sold = test)\n",
    "head(submission_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "70e1a721",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-01-03T15:44:24.284171Z",
     "iopub.status.busy": "2025-01-03T15:44:24.282604Z",
     "iopub.status.idle": "2025-01-03T15:44:24.295409Z",
     "shell.execute_reply": "2025-01-03T15:44:24.293388Z"
    },
    "papermill": {
     "duration": 0.059768,
     "end_time": "2025-01-03T15:44:24.298263",
     "exception": false,
     "start_time": "2025-01-03T15:44:24.238495",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#write.csv(submission_df, 'stickers_0.csv', row.names = FALSE)"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "databundleVersionId": 10652996,
     "sourceId": 85723,
     "sourceType": "competition"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 743.89584,
   "end_time": "2025-01-03T15:44:24.564171",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2025-01-03T15:32:00.668331",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}