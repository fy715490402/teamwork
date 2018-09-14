package com.tw.domain.forum;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@DiscriminatorValue("0")
public class MainPost extends Post {
}
