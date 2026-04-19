import { LightningElement } from 'lwc';
import myfunction from './myfunction';

export default class AdditionalJavacriptDemo extends LightningElement {
valDefault = myfunction();
}