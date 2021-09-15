+++
title = "How to create a custom radio component in Vue"
description = "Step by step guide on how to create a custom vue js radio input"
tags = ["vue"]
keywords = ["custom input component in vue", "vue custom components"]
date = "2021-09-15"
categories = ["vue"]
slug = "create-custom-radio-component-in-vue"
+++

Vue is one of the most intuitive frontend frameworks I've used but creating custom input components is one thing that has never been easy. The day when I first searched if I could create a custom v-model on any input this article on [adding v-model support for components by Alligator](https://alligator.io/vuejs%2Fadd-v-model-support%2F%2F) was very useful.


## How v-model works

This is programatic definition of v-model:

```vue
<input v-model="name" />
// is basically a shorthand for
<input :value="name" @input="(e) => name = e.target.value"/>
```

> v-model = @input + value

This is super useful to create two way binding and it's good to know how it works under the hood. I wish React had something similar to v-model so that we don't have to pass seperate props and methods to the child component.


## v-model for radio, checkbox and select

This gets interesting because radio, checkbox and select input have already reserved the keyword `value` so the above definition doesn't hold and it changes a bit. This is what is not document and explained clearly with examples.

[Vue docs for forms](https://vuejs.org/v2/guide/forms.html#Basic-Usage) do tell us something about this but that's incomplete code and doesn't take us far.

This excerpt from doc is the first pointer in the right direction.

- text and textarea elements use value property and input event;
- checkboxes and radiobuttons use checked property and change event;
- select fields use value as a prop and change as an event.

## Code for custom radio component in Vue

I'll do less talking and give you the code right away to see what a working custom radio vue-component looks like:

```vue
<template>
  <div>
    <input type="radio" :id="id" :value="value" :name="name" v-model="radioModal" />
    <label :for="id">
      <slot></slot>
    </label>
  </div>
</template>

<script>
export default {
  model: {
    prop: 'checked',
    event: 'change'
  },
  props: {
    checked: [String, Number, Boolean],
    id: String,
    name: String,
    value: String,
    required: Boolean
  },
  computed: {
    radioModal: {
      get() {
        return this.checked;
      },
      set() {
        this.$emit('change', event.target.value);
      }
    }
  }
};
</script>
```

This is when I discovered the [model API](https://vuejs.org/v2/api/#model). It basically allows us to customize the event and prop that will form the v-model.

Other props are just forwading. We could use `$attrs` but I like to manually map them just for new readers in my codebase. In this case I've only added a few of them `name`, `value`, `required` and `checked` which comes from the v-model part.

Then we have a computed property which basically makes sure to take in the right value and emit the value instead of event from the inside.

And that's our working custom Vue.js radio input. We can follow similar pattern and create component for select or checkbox. Let me know if you have question. :)

## References
- https://forum.vuejs.org/t/v-model-does-not-check-radio-button-in-custom-component
- https://vuejs.org/v2/guide/forms.html#Basic-Usage
