---
## Front matter
lang: en-GB
title: Доклад
subtitle: X-ray Image Analysis Using Machine Learning Methods
author:
  - Artamomov T. E.
institute:
  - Peoples’ Friendship University of Russia named after Patrice Lumumba, Moscow, Russia
date: April 7th 2024

## i18n babel
babel-lang: english
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Contents
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Information

## Speaker

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Artamonov Timofey Evgenievich
  * student of group NKNbd-01-21
  * Peoples’ Friendship University of Russia named after Patrice Lumumba
  * <https://github.com/teartamonov>
  * meiwenk46@gmail.com

:::
::: {.column width="30%"}

![](image/ava.jpg)

:::
::::::::::::::

## Introduction

Many diseases can be detected in the chest area using X-ray images. However, a correct diagnosis requires a lot of experience from the specialist who makes it. Nevertheless, even this does not guarantee a correct diagnosis, because the images may be, for example, of poor quality, which will make it difficult to make a correct diagnosis. In such cases and in general, Artificial Intelligence (AI), namely a model for Computer Vision (CV), can help to optimize and automate the work. 

## Purpose of work

To Fine-tune pre-trained machine learning models on chest X-rays to make them resistant to the noise that is characteristic of images in this area.

## Задачи

- To preprocess the dataset correctly
- To fine-tune multiple models with different architectures
- To analyze the results and choose the best model

## Related Work

Classification and Segmentation are the two biggest tasks in CV and both of these approaches are used to solve problems in medicine. It is often the image segmentation approach that is used for this type of task, but markup for such a dataset is a rather complex process that requires an experienced specialist. Many articles focus on a particular area of the human body, and this article is no exception. Other studies use only one model, while this article is exploratory and observational in nature, which shows a comparison of different models with different architectures to find out what is best suited for such a specific task as classifying X-ray images.

##  Pre-training and Fine-tuning

All models were pre-trained on such large datasets as ImageNet-1K with 1000 classes, so models which have seen a huge number of very different images will be more stable during fine-tuning whennoise appears in both training and test data after training. Fine-tuning was performed using Pytorch with the freezing of model layers and changing the last layer to Dense with the number of neurons equal to the number of classes. The Sigmoid activation function was used separately for model validation and metric verification, because The loss function was used by Binary Cross-Entropy with Logits, which, as the name suggests, takes logits as input, rather than probabilities, which are obtained after applying the Sigmoid activation function.

## Datasets

This study used one chest X-Ray images dataset on the NIH Chest X-ray Dataset that was compiled of 112,120 X-ray images with disease labels from 30,805 unique patients. The models were trained in different ways in different numbers of classes. There was a very pronounced data imbalance in the specified dataset. As a result of the experiments, only four classes of diseases were left to improve the quality of the models. From the dataset, only Image Index image names and found diseases were used - FindingLabels. The images were compressed to a size of 224x224 pixels to meet the requirements of the ResNet model. The classes Atelectasis, Infiltration, Effusion, and No-finding were chosen for training. 

## Models

Several models were selected for the study, including: Resnet-152, VGG-16, EfficientNet, YOLO and ViT, but due to the limitations of computing power and the questionable practical benefits of using outdated models, this list was shortened. This article discusses such pre-trainedmodels as ResNet-152, YOLO and ViT. The parameters were selected separately for each model. Since the pre-trained architecture of the YOLO model cannot be changed, it was trained with its own loss function and its own optimizer.

## Training parameters

Experiments were conducted with training completely frozen and completely unfrozen layers of the ResNet-152 model, and as a result, the quality metrics and the loss function indicator did not differ significantly between these two variants. The models showed better results in the form of metrics when using a higher learning rate, because it still decreases during the learning process. The training was conducted on an Nvidia Tesla V100 with 32GB of memory. Pytorch Dataloader with batch_size=128 was used for training. For ResNet-152 and ViT, the BCEWithLogitsLoss loss function with the pos_weight parameter was used to balance class weights. This parameter is a list of weights for each class. These weights are calculated as the ratio of negative examples to positive ones. Thus, they were trained: 
- Resnet-152 with optimizer AdaGrad(lr=0.001)
- ViT with optimizer Adam(lr=0.001)
- YOLO with optimizer SGD(lr=0.01)

## Results

As a result of training three models on the same data set, the final metrics on the test data turned out to be quite different. Classical metrics for the classification problem were chosen: Precision, Recall and F1-Score. High precision means fewer false-positives, high recall means fewer false-negatives ,the F1-Score is highest when precision and recall are balanced. 
The best metrics on the validation dataset in [Table1](#Table1).

<a name="Table1"></a>
**Table 1. The best metrics of models on the validation dataset**  
| Model   | Precision | Recall | F1Score |
|-----------|----------|---------|---------|
| ResNet-152 | 0.55 | 0.42 | 0.48 |
| ViT | 0.58 | 0.70 | 0.58 |
| YOLO | 0.22 | 0.22 | 0.11 |

## Discussion

The obvious winner of these three models is ViT. However, it can be seen that, in general, the metrics of all models for all classes are quite low. The YOLO model has the lowest performance, most likely due to the fact that the model's architecture assumes a standard classification rather than a multi-label classification. Despite this, we should not exclude the fact that YOLO models specialize in image segmentation rather than classification. ViT's small victory over ResNet can be explained by the fact that the model is newer, and also, like a transformer, has self-attention layers, which can help the model find signs of diseases in images more effectively, since X-ray images are a rather specific type of images for models who were trained on ImageNet, where classes are more familiar. objects. This can also explain the generally low metrics of all models. However, we should also not forget that the task of multi-label classification was solved, which also introduces additional complexity.

## Conclusion and future work

In this article, several pre-trained models with different architectures for recognizing chest diseases from X-ray diseases were investigated. As a result of the training, the ViT transformer model showed the best results, while YOLO showed the worst results among the models. And although the overall metrics turned out to be low, the ViT model finds patients without diseases quite well with a high Recall for diseases, on average 75%, which is a good indicator, because it means that healthy people are considered sick more often than healthy patients, therefore, the model will miss fewer patients with diseases, which would reduce mortality if only the models were measured by such a metric. In the following works, research will be conducted to improve the performance of models and apply new learning methods such as segmentation.
