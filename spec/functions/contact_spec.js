import Contact from '../../functions/contact/src/index';

describe('Contact', () => {
  let event, context;

  beforeEach(() => {
    event = {};
    context = {succeed: jasmine.createSpy('succeed'), fail: jasmine.createSpy('fail')};
  });

  it('succeeds and redirects', () => {
    Contact(event, context);
    expect(context.succeed).toHaveBeenCalledWith({
      location: 'https://www.ministryofvelocity.com/thanks'
    });
  });
});
