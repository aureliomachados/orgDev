import { createElement } from 'lwc';
import UnitTest from '../unitTest';

describe('c-unit-test', () => {
    afterEach(() => {
        // the jsdom instance is shared across test cases in a single file so reset the DOM 
        while(document.body.firstChild){
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('display unit status with default unitNumber', () => {
        const element = createElement('c-unit-test', {
            is: UnitTest
        });
        expect(element.unitNumber).toBe(5);
        // add the element to the jsdom instance
        document.body.appendChild(element);

        //verify displayed greeting 
        const div = element.shadowRoot.querySelector('div');
        expect(div.textContent).toBe('Unit 5 alive!');
    });

    it('display unit status with updated unitNumber', () =>{
        const element = createElement('c-unit-test', {
            is: UnitTest
        });
        document.body.appendChild(element);
        element.unitNumber = 6;

        const div = element.shadowRoot.querySelector('div');

        expect(div.textContent).not.toBe('Unit 6 alive!');

        return Promise.resolve().then(() => {
            expect(div.textContent).toBe('Unit 6 alive!');
        });

    });

    it('displays unit status with input change event', () => {
        const element = createElement('c-unit-test', {
            is: UnitTest
        });

        document.body.appendChild(element);

        const div = element.shadowRoot.querySelector('div');

        const inputElement  = element.shadowRoot.querySelector('lightning-input');
        inputElement.value = 7;
        inputElement.dispatchEvent(new CustomEvent('change'));

        return Promise.resolve().then(() => {
            expect(div.textContent).toBe('Unit 7 alive!');
        });
    });
});